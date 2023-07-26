package com.chat.system.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.PermanentUser;
import com.chat.system.domain.AppOrder;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.AppVip;
import com.chat.system.service.ApplePayService;
import com.chat.system.service.IAppOrderService;
import com.chat.system.service.IAppUserService;
import com.chat.system.service.IAppVipService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
@Slf4j
public class ApplePayServiceImpl implements ApplePayService {

    @Resource
    private IAppOrderService appOrderService;

    @Resource
    private IAppVipService appVipService;

    @Resource
    private IAppUserService appUserService;

    @Override
    public AjaxResult getAppPay(String productId, JSONObject jsonObject, String status, Integer userId) {

        //判断是否验证成功
        if ("0".equals(status)) {
            //app端所提供的收据是有效的,验证成功
            String receipt = jsonObject.getString("receipt");
            JSONObject returnJson = JSONObject.parseObject(receipt);
            String in_app = returnJson.getString("in_app");
            JSONObject in_appJson = JSONObject.parseObject(in_app.substring(1, in_app.length() - 1));
            String transactionId = in_appJson.getString("transaction_id");
            String in_app_ownership_type = in_appJson.getString("in_app_ownership_type");
            //如果验证后的订单号与app端传来的订单号一致并且状态为已支付状态则处理自己的业务
            if ("PURCHASED".equals(in_app_ownership_type)) {
                //===================处理自己的业务 ============================
                // 1、创建订单
                this.create(productId, userId, transactionId);
                // 2、会员处理
                // 获取会员信息
                QueryWrapper<AppVip> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("product_id", productId);
                AppVip byId = appVipService.getOne(queryWrapper);
                if (byId == null) {
                    log.error("产品的id在数据库中未查出，产品的id:{}", productId);
                    return AjaxResult.success();
                }
                // 查询用户的信息
                AppUser appUser = appUserService.getById(userId);
                if (byId.getName().equals("终身会员")) {
                    appUser.setPermanent(PermanentUser.permanent.getCode());
                } else {
                    // 增加到的日期
                    Date date = this.getDate(byId);
                    // 判断会员是否首冲
                    boolean first = isFirst(userId);
                    if (first) {
                        date = DateUtil.offsetDay(date, byId.getAddDay());
                    }
                    // 判断用户是否已经过期
                    if (appUser.getExpireTime().after(new Date())) {
                        date = DateUtil.offsetDay(date, (int) (appUser.getExpireTime().getTime() / 1000 / 60 / 60 / 24 - (new Date()).getTime() / 1000 / 60 / 60 / 24));
                    }
                    appUser.setExpireTime(date);
                }
                appUserService.updateById(appUser);
            }
            return AjaxResult.success();
        }
        return AjaxResult.error("苹果内购验证失败");
    }

    /**
     * 创建订单，productId就是产品的id
     */
    @Override
    public String create(String productId, Integer userId, String orderId) {
        AppOrder appOrder = new AppOrder();
        // 0未支付、1已支付
        appOrder.setPayStatus(1);
        appOrder.setCreateTime(new Date());
        appOrder.setVipId(productId);
        appOrder.setUserId(userId);
        appOrder.setOrderId(orderId);
        appOrderService.save(appOrder);
        return orderId;
    }

    public boolean isFirst(Integer userId) {
        QueryWrapper<AppOrder> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        long count = appOrderService.count(queryWrapper);
        return count <= 1;
    }

    public Date getDate(AppVip appVip) {
        String name = appVip.getName();
        DateTime dateTime = new DateTime();
        if (name.equals("周会员")) {
            dateTime = DateUtil.nextWeek();
        }
        if (name.equals("包月会员")) {
            dateTime = DateUtil.nextMonth();
        }
        if (name.equals("包季会员")) {
            dateTime = DateUtil.offsetMonth(new Date(), 3);
        }
        if (name.equals("包年会员")) {
            dateTime = DateUtil.offsetMonth(new Date(), 12);
        }
        return dateTime;
    }

}

package com.chat.app.pay;

import com.alibaba.fastjson.JSONObject;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.utils.ApplePayUtil;
import com.chat.system.domain.query.PayQuery;
import com.chat.system.service.IApplePayService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
@RequestMapping(value = "/app/order")
public class ApplePayController extends APPController {

    @Resource
    private IApplePayService applePayService;

    @Resource
    private ApplePayUtil applePayUtil;

    /**
     * TransactionID订单号
     * receipt订单加密收据
     * Ios客户端内购支付
     */
    @RequestMapping("/pay")
    public AjaxResult doIosRequest(@RequestBody PayQuery payQuery) throws InterruptedException {
        String receipt = payQuery.getReceipt();
        String productId = payQuery.getProductId();
        Integer userId = getUserId();
        log.info("用户的id是：{}，收据是：{}，产品的id是：{}", userId, receipt, productId);
        String verifyResult = applePayUtil.buyAppVerify(receipt, 1);
        //苹果服务器没有返回验证结果，那就再试一次
        if (verifyResult == null){
            Thread.sleep(1000);
            verifyResult = applePayUtil.buyAppVerify(receipt, 1);
        }
        if (verifyResult == null) {
            return error();
        } else {
            JSONObject jsonObject = JSONObject.parseObject(verifyResult);
            log.info("用户的id:{},苹果服务器返回的信息：{}", userId, jsonObject);
            String status = jsonObject.getString("status");
            if ("21007".equals(status)) {   //是沙盒环境，应沙盒测试，否则执行下面
                verifyResult = applePayUtil.buyAppVerify(receipt, 0);  //2.再沙盒测试  发送平台验证
                if (verifyResult == null){
                    Thread.sleep(1000);
                    verifyResult = applePayUtil.buyAppVerify(receipt, 0);
                }
                jsonObject = JSONObject.parseObject(verifyResult);
                log.info("用户的id:{},苹果服务器返回的信息：{}", userId, jsonObject);
                status = jsonObject.getString("status");
            }
            return applePayService.getAppPay(productId, jsonObject, status, userId);
        }
    }

    @RequestMapping("create")
    public AjaxResult create(@RequestParam("productId") Integer productId) {
        //Integer userId = getUserId();
        //String transactionId = applePayService.create(productId, userId);
        return success();
    }

}

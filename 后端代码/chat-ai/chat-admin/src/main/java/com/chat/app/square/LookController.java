package com.chat.app.square;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.PermanentUser;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.AppLook;
import com.chat.system.domain.AppUser;
import com.chat.system.service.IAppGoodMessageService;
import com.chat.system.service.IAppLookService;
import com.chat.system.service.IAppUserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

@RestController
@RequestMapping("/app/look")
public class LookController extends APPController {

    @Resource
    private IAppLookService appLookService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppUserService appUserService;

    /**
     * 查看答案
     */
    @RequestMapping("/select")
    public AjaxResult add(@RequestParam("id") Integer id) {
        AppGoodMessage byId = appGoodMessageService.getById(id);
        Integer userId = getUserId();
        // 判断之前查看过吗
        QueryWrapper<AppLook> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("good_message_id", id);
        long count = appLookService.count(queryWrapper);
        // 查看过直接返回内容
        if (count > 0) {
            return success(byId.getAiMessageContent());
        }
        // 获取用户的信息
        AppUser user = appUserService.getById(userId);
        // 判断用户剩余天数及积分
        if (user.getPermanent().equals(PermanentUser.noPermanent.getCode()) && user.getExpireTime().before(new Date()) && user.getCoin() <= 0) {
            return new AjaxResult(303, "");
        }
        if (user.getPermanent().equals(PermanentUser.noPermanent.getCode()) && user.getExpireTime().before(new Date())) {
            // 扣减积分
            user.setCoin(user.getCoin() - 1);
            appUserService.updateById(user);
        }
        AppLook appLook = new AppLook();
        appLook.setCreateTime(new Date());
        appLook.setUserId(userId);
        appLook.setGoodMessageId(id);
        appLookService.save(appLook);
        return success(byId.getAiMessageContent());
    }

}

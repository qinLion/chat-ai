package com.chat.app.user;

import com.chat.common.config.RedisKeyConfig;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.redis.RedisCache;
import com.chat.common.enums.DeleteOrAvailableStatus;
import com.chat.common.utils.SendSms;
import com.chat.system.domain.AppUser;
import com.chat.system.service.IAppUserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/app/login")
public class LoginController extends APPController {

    @Resource
    private IAppUserService appUserService;

    @Resource
    private RedisCache redisCache;

    /**
     * 手机号一键登录
     */
    @RequestMapping("/direct")
    public AjaxResult direct(@RequestParam("loginToken") String loginToken, @RequestParam(value = "inviteCode", required = false) String inviteCode) {
        String token = appUserService.direct(loginToken, inviteCode);
        return AjaxResult.success("登录成功", token);
    }

    /**
     * 发送验证码
     */
    @GetMapping("/sendCode")
    public AjaxResult send(@RequestParam("phone") String phone) {
        Random random = new Random();
        int i = random.nextInt(8999);
        String code = 1000 + i + "";
        boolean send = SendSms.Send(phone, code);
        if (send) {
            redisCache.setCacheObject(RedisKeyConfig.smsCode + phone, code, 2, TimeUnit.MINUTES);
            return AjaxResult.success("获取验证码成功");
        }
        return AjaxResult.error("获取验证码失败");
    }

    /**
     * 验证码登录
     */
    @RequestMapping("/code")
    public AjaxResult code(@RequestParam("phone") String phone, @RequestParam("code") String code, @RequestParam(value = "inviteCode", required = false) String inviteCode) {
        String token = appUserService.code(phone, code, inviteCode);
        return AjaxResult.success("登录成功", token);
    }

    /**
     * 用户登出
     */
    @RequestMapping("/logout")
    public AjaxResult logout() {
        String token = getToken();
        String userId = token.split("-")[0];
        appUserService.delRedis(userId);
        return AjaxResult.success("登出成功");
    }

    /**
     * 用户注销
     */
    @RequestMapping("/logoff")
    public AjaxResult logoff() {
        Integer userId = getUserId();
        // 更改用户的状态为删除
        AppUser byId = appUserService.getById(userId);
        byId.setIsDelete(DeleteOrAvailableStatus.DELETED.getCode());
        appUserService.updateById(byId);
        // 删除token
        appUserService.delRedis(userId + "");
        return AjaxResult.success("注销成功");
    }


}

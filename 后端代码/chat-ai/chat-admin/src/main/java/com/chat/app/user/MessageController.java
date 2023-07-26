package com.chat.app.user;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.system.service.IAppUserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/app/message")
public class MessageController extends APPController {

    @Resource
    private IAppUserService appUserService;

    /**
     * 获取用户的信息
     */
    @PostMapping("/info")
    public AjaxResult info() {
        return success();
    }

}

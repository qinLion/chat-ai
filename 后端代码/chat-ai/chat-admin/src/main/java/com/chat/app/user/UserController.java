package com.chat.app.user;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.utils.StringUtils;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.res.AppUserInfoRes;
import com.chat.system.service.IAppUserService;
import com.chat.web.controller.common.CommonController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@RestController
@RequestMapping("/app/user")
public class UserController extends APPController {

    @Resource
    private IAppUserService appUserService;

    @Resource
    private CommonController commonController;

    /**
     * 获取用户的信息
     */
    @RequestMapping("/info")
    public AjaxResult info() {
        Integer id = getUserId();
        AppUserInfoRes appUserInfoRes = appUserService.info(id);
        return AjaxResult.success("查询成功", appUserInfoRes);
    }

    /**
     * 编辑头像
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) {
        AjaxResult ajaxResult = commonController.uploadFile(file);
        if (ajaxResult.isSuccess()) {
            return success("https://www.chataizs.cn/prod-api" + ajaxResult.get("fileName"));
        }
        return ajaxResult;
    }

    /**
     * 修改用户资料
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody AppUser appUser) {
        Integer id = getUserId();
        if (appUser == null) {
            return error();
        }
        AppUser update = new AppUser();
        update.setId(id);
        update.setSex(appUser.getSex());
        update.setAge(appUser.getAge());
        update.setNickname(appUser.getNickname());
        update.setPhoto(appUser.getPhoto());
        if (StringUtils.isNotEmpty(appUser.getPhone())) {
            update.setPhone(appUser.getPhone());
        }
        appUserService.updateById(update);
        return success();
    }


}

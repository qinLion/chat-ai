package com.chat.web.controller.app;

import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.AppVip;
import com.chat.system.domain.query.AppUserListQuery;
import com.chat.system.domain.res.SysAppUserRes;
import com.chat.system.service.IAppUserService;
import com.chat.system.service.IAppVipService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户信息
 *
 * @author chat
 */
@RestController
@RequestMapping("/system/app/user")
public class SysAppUserController extends BaseController {

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppVipService appVipService;

    /**
     * 获取用户列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppUserListQuery user) {
        List<AppVip> list = appVipService.list();
        // 设置那种类型
        for (AppVip appVip : list) {
            if (appVip.getId().equals(user.getVipType())) {
                user.setVipString(appVip.getProductId());
            }
        }
        startPage();
        List<SysAppUserRes> lis = appUserService.sysUserList(user, list);
        return getDataTable(lis);
    }

    /**
     * 更改用户的状态
     */
    @GetMapping("/update")
    public AjaxResult update(AppUser user) {
        if (user.getId() == null) {
            return error();
        }
        AppUser appUser = new AppUser();
        appUser.setId(user.getId());
        appUser.setIsAvailable(user.getIsAvailable());
        appUserService.updateById(appUser);
        appUserService.delRedis(user.getId() + "");
        return success();
    }

}

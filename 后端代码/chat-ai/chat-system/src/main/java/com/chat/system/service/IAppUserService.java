package com.chat.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.AppVip;
import com.chat.system.domain.query.AppUserListQuery;
import com.chat.system.domain.res.AppUserInfoRes;
import com.chat.system.domain.res.SysAppUserRes;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface IAppUserService extends IService<AppUser> {

    String direct(String loginToken, String inviteCode);

    String code(String phone, String code, String inviteCode);

    AppUser getUser(String phone);

    AppUserInfoRes info(Integer id);

    List<SysAppUserRes> sysUserList(AppUserListQuery user, List<AppVip> list);

    void delRedis(String userIdPre);
}

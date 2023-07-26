package com.chat.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.query.AppUserListQuery;
import com.chat.system.domain.res.SysAppUserRes;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface AppUserMapper extends BaseMapper<AppUser> {

    List<SysAppUserRes> sysUserList(AppUserListQuery user);
}

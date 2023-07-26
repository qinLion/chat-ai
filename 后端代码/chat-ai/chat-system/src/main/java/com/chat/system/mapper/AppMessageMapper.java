package com.chat.system.mapper;

import com.chat.system.domain.AppMessage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppMessageRes;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface AppMessageMapper extends BaseMapper<AppMessage> {

    List<SysAppMessageRes> sysList(AppMessageListQuery user);
}

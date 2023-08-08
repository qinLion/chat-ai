package com.chat.system.mapper;

import com.chat.system.domain.AppSupportLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.res.AppNoticeSupportMapperRes;
import com.chat.system.domain.res.AppNoticeSupportRes;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
public interface AppSupportLogMapper extends BaseMapper<AppSupportLog> {

    List<AppNoticeSupportMapperRes> supportNotice(Integer userId);

}

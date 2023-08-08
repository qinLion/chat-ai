package com.chat.system.service;

import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppSupportLog;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.res.AppNoticeSupportRes;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
public interface IAppSupportLogService extends IService<AppSupportLog> {

    List<AppNoticeSupportRes> supportNotice(PageQuery pageQuery, Integer userId);
}

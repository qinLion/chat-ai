package com.chat.system.service;

import com.chat.system.domain.AppSupport;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-29
 */
public interface IAppSupportService extends IService<AppSupport> {

    boolean isSupport(Integer userId, Integer type, Integer supportId, Integer supportTo, Integer supportUserId);

    int commentSupportCount(Integer id);

}

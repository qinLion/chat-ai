package com.chat.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.AppCollect;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
public interface IAppCollectService extends IService<AppCollect> {

    boolean isCollect(Integer userId, Integer type, Integer collectId);

}

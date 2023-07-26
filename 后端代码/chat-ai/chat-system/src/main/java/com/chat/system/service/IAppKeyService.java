package com.chat.system.service;

import com.chat.system.domain.AppKey;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-22
 */
public interface IAppKeyService extends IService<AppKey> {

    void test();

    int test(String key);
}

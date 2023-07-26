package com.chat.system.service;

import com.chat.system.domain.AppVip;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.res.AppVipRes;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-13
 */
public interface IAppVipService extends IService<AppVip> {

    List<AppVipRes> getVipList();

}

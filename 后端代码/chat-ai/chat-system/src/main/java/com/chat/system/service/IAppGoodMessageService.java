package com.chat.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.query.AppGoodMessageAddQuery;
import com.chat.system.domain.res.AppGoodMessageListRes;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface IAppGoodMessageService extends IService<AppGoodMessage> {

    // 获取所有id
    List<Integer> getAllId();

    int sensitive(String userContent);

    /**
     * 广场列表
     */
    List<AppGoodMessageListRes> squareList(PageQuery pageQuery, Integer userId, boolean flag);


    void add(Integer userId, AppGoodMessageAddQuery appGoodMessageAddQuery);
}

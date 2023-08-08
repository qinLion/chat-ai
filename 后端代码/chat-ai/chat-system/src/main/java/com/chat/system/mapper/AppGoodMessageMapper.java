package com.chat.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.AppGoodMessage;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface AppGoodMessageMapper extends BaseMapper<AppGoodMessage> {

    List<Integer> getAllId();

    /**
     * 查询用户的收藏列表
     */
    List<AppGoodMessage> userList(Integer cUserId);
}

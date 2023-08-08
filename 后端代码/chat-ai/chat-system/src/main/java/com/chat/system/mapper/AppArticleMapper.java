package com.chat.system.mapper;

import com.chat.system.domain.AppArticle;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-22
 */
public interface AppArticleMapper extends BaseMapper<AppArticle> {

    List<AppArticle> userList(Integer userId);
}

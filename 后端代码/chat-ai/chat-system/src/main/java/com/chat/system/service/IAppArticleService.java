package com.chat.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.res.AppArticleListRes;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-22
 */
public interface IAppArticleService extends IService<AppArticle> {

    List<AppArticleListRes> squareList(PageQuery pageQuery, Integer userId, boolean flag);
}

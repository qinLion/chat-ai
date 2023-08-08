package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.res.AppArticleListRes;
import com.chat.system.mapper.AppArticleMapper;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCollectService;
import com.chat.system.service.IAppSupportService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-22
 */
@Service
public class AppArticleServiceImpl extends ServiceImpl<AppArticleMapper, AppArticle> implements IAppArticleService {


    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private IAppSupportService appSupportService;

    @Resource
    private AppArticleMapper appArticleMapper;

    /**
     * 文章的列表
     */
    @Override
    public List<AppArticleListRes> squareList(PageQuery pageQuery, Integer userId, boolean flag) {
        // 返回的
        List<AppArticleListRes> resList = new ArrayList<>();
        // 进行分页
        PageHelper.startPage(pageQuery.getPageNum(), pageQuery.getPageSize());
        List<AppArticle> appArticles;
        if (flag) {
            appArticles = appArticleMapper.userList(userId);
        } else {
            QueryWrapper<AppArticle> queryWrapper = new QueryWrapper<>();
            queryWrapper.orderByDesc("id");
            // 获取文章列表
            appArticles = this.list(queryWrapper);
        }
        for (AppArticle appArticle : appArticles) {
            String content = appArticle.getContent();
            AppArticleListRes res = new AppArticleListRes();
            res.setId(appArticle.getId());
            res.setContent(content.replaceAll("/prod-api/profile", "https://www.chataizs.cn/prod-api/profile"));
            res.setCollectCount(appArticle.getCollectCount());
            res.setCommentCount(appArticle.getCommentCount());
            res.setSupportCount(appArticle.getSupportCount());
            res.setReadCount(appArticle.getReadCount());
            res.setTitle(appArticle.getTitle());
            res.setCreateTime(DateUtils.dateToString(appArticle.getCreateTime()));
            // 判断当前用户有没有收藏过
            res.isCollect = appCollectService.isCollect(userId, CollectTypeEnum.gl.getCode(), appArticle.getId());
            // 判断当前用户有没有点赞过
            res.isSupport = appSupportService.isSupport(userId, CollectTypeEnum.gl.getCode(), appArticle.getId(), SupportOrCommentFrom.supportOrComment.getCode(), null);
            resList.add(res);
        }
        return resList;
    }
}

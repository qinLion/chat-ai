package com.chat.app.square;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.res.AppArticleListRes;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCollectService;
import com.chat.system.service.IAppSupportService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/app/article")
public class ArticleController extends APPController {

    @Resource
    private IAppArticleService appArticleService;

    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private IAppSupportService appSupportService;

    /**
     * 攻略列表
     */
    @RequestMapping("/list")
    public AjaxResult list(@RequestBody PageQuery pageQuery) {
        Integer userId = getUserId();
        List<AppArticleListRes> re = appArticleService.squareList(pageQuery, userId, false);
        return success(re);
    }

    /**
     * 增加阅读量——同时返回攻略详情
     */
    @RequestMapping("addRead")
    public AjaxResult list(@RequestParam("id") Integer id) {
        Integer userId = getUserId();
        AppArticle appArticle = appArticleService.getById(id);

        // 增加阅读量
        appArticle.setReadCount(appArticle.getReadCount() + 1);
        appArticleService.updateById(appArticle);

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

        return success(res);
    }

}

package com.chat.web.controller.app;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.common.utils.DateUtils;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.query.AppArticleListQuery;
import com.chat.system.service.IAppArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 用户信息
 *
 * @author chat
 */
@RestController
@RequestMapping("/system/app/article")
public class SysAppArticleController extends BaseController {

    @Resource
    private IAppArticleService appArticleService;

    /**
     * 获取文章列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppArticleListQuery user) {
        startPage();
        QueryWrapper<AppArticle> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(user.getTitle())) {
            queryWrapper.like("title", user.getTitle());
        }
        queryWrapper.orderByDesc("create_time");
        List<AppArticle> lis = appArticleService.list(queryWrapper);
        for (AppArticle li : lis) {
            li.setCreateTimeString(DateUtils.dateToString(li.getCreateTime()));
        }
        return getDataTable(lis);
    }

    /**
     * 删除文章
     */
    @GetMapping("/delete")
    public AjaxResult delete(@RequestParam("id") Integer id) {
        appArticleService.removeById(id);
        return success();
    }

    /**
     * 新建文章
     */
    @PostMapping("/add")
    public AjaxResult delete(@RequestBody AppArticle appArticle) {
        AppArticle article = new AppArticle();
        article.setContent(appArticle.getContent());
        article.setTitle(appArticle.getTitle());
        article.setReadCount(0);
        article.setCreateTime(new Date());
        article.setCommentCount(0);
        article.setSupportCount(0);
        article.setCollectCount(0);
        appArticleService.save(article);
        return success();
    }

    /**
     * 修改文章
     */
    @PostMapping("/update")
    public AjaxResult update(@RequestBody AppArticle appArticle) {
        AppArticle article = new AppArticle();
        article.setId(appArticle.getId());
        article.setContent(appArticle.getContent());
        article.setTitle(appArticle.getTitle());
        appArticleService.updateById(article);
        return success();
    }

    /**
     * 获取文章信息
     */
    @GetMapping("/select")
    public AjaxResult select(@RequestParam("id") Integer id) {
        AppArticle byId = appArticleService.getById(id);
        return success(byId);
    }


}

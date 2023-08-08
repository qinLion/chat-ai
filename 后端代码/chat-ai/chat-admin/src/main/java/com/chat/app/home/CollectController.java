package com.chat.app.home;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.AppCollect;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.query.FeedBackQuery;
import com.chat.system.domain.query.FeedBackQueryList;
import com.chat.system.domain.res.AppArticleListRes;
import com.chat.system.domain.res.AppGoodMessageListRes;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCollectService;
import com.chat.system.service.IAppGoodMessageService;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/collect")
public class CollectController extends APPController {

    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;

    /**
     * 点击收藏——答案
     */
    @PostMapping("add")
    public AjaxResult add(@RequestBody FeedBackQuery feedBackQuery) {
        Integer userId = getUserId();

        AppCollect appCollect = new AppCollect();
        appCollect.setUserContent(feedBackQuery.getUserContent());
        appCollect.setAiContent(feedBackQuery.getAiContent());
        appCollect.setCreateTime(new Date());
        appCollect.setType(CollectTypeEnum.chat.getCode());
        appCollect.setUserId(userId);
        appCollectService.save(appCollect);
        return success(appCollect.getId());
    }

    /**
     * 点击收藏——答案
     */
    @PostMapping("addList")
    public AjaxResult addList(@RequestBody FeedBackQueryList feedBackQueryList) {
        List<FeedBackQuery> feedBackQuerys = feedBackQueryList.getFeedBackList();
        Integer userId = getUserId();
        List<Integer> resCount = new ArrayList<>();
        for (FeedBackQuery feedBackQuery : feedBackQuerys) {
            AppCollect appCollect = new AppCollect();
            appCollect.setUserContent(feedBackQuery.getUserContent());
            appCollect.setAiContent(feedBackQuery.getAiContent());
            appCollect.setCreateTime(new Date());
            appCollect.setType(CollectTypeEnum.chat.getCode());
            appCollect.setUserId(userId);
            appCollectService.save(appCollect);
            resCount.add(appCollect.getId());
        }
        return success(resCount);
    }

    /**
     * 点击收藏——问题跟攻略
     */
    @RequestMapping("addSquare")
    public AjaxResult addSquare(@RequestParam("id") Integer id, @RequestParam("type") Integer type) {
        // 防止重复收藏，需要进行判断
        Integer userId = getUserId();
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("content_id", id);
        queryWrapper.eq("type", type);
        long count = appCollectService.count(queryWrapper);
        if (count > 0) {
            return success();
        }
        AppCollect appCollect = new AppCollect();
        appCollect.setContentId(id);
        appCollect.setUserId(userId);
        appCollect.setType(type);
        appCollect.setCreateTime(new Date());
        appCollectService.save(appCollect);
        // 收藏的提问或者攻略加1
        if (type.equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage byId = appGoodMessageService.getById(id);
            byId.setCollectCount(byId.getCollectCount() + 1);
            appGoodMessageService.updateById(byId);
        } else {
            AppArticle byId = appArticleService.getById(id);
            byId.setCollectCount(byId.getCollectCount() + 1);
            appArticleService.updateById(byId);
        }
        return success();
    }

    /**
     * 取消收藏——问题跟攻略
     */
    @RequestMapping("cancelSquare")
    public AjaxResult cancelSquare(@RequestParam("id") Integer id, @RequestParam("type") Integer type) {
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", getUserId());
        queryWrapper.eq("type", type);
        queryWrapper.eq("content_id", id);
        boolean remove = appCollectService.remove(queryWrapper);
        // 收藏的提问或者攻略减1
        if (remove && type.equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage byId = appGoodMessageService.getById(id);
            byId.setCollectCount(byId.getCollectCount() - 1);
            appGoodMessageService.updateById(byId);
        }
        if (remove && type.equals(CollectTypeEnum.gl.getCode())) {
            AppArticle byId = appArticleService.getById(id);
            byId.setCollectCount(byId.getCollectCount() - 1);
            appArticleService.updateById(byId);
        }
        return success();
    }

    /**
     * 取消收藏
     */
    @GetMapping("remove")
    public AjaxResult remove(@RequestParam("id") Integer id) {
        Assert.isTrue(id != null, "收藏id不能为空");
        appCollectService.removeById(id);
        return success();
    }

    /**
     * 清空收藏
     */
    @GetMapping("removeAll")
    public AjaxResult removeAll(@RequestParam("type") Integer type) {
        Integer userId = getUserId();
        Assert.isTrue(type != null, "收藏类型不能为空");
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", type);
        queryWrapper.eq("user_id", userId);
        appCollectService.remove(queryWrapper);
        return success();
    }

    /**
     * 查询收藏
     */
    @GetMapping("select")
    public AjaxResult select(@RequestParam("type") Integer type) {
        Integer userId = getUserId();
        Assert.isTrue(type != null, "收藏类型不能为空");
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("type", type);
        queryWrapper.eq("user_id", userId);
        List<AppCollect> list = appCollectService.list(queryWrapper);
        return success(list);
    }

    /**
     * 取消收藏——广场
     */
    @RequestMapping("cancelQuestion")
    public AjaxResult cancelSquare(@RequestParam("id") Integer id) {
        this.cancelSquare(id, CollectTypeEnum.gc.getCode());
        return success();
    }

    /**
     * 取消收藏——攻略
     */
    @RequestMapping("cancelIntroduction")
    public AjaxResult cancelIntroduction(@RequestParam("id") Integer id) {
        this.cancelSquare(id, CollectTypeEnum.gl.getCode());
        return success();
    }

    /**
     * 查询收藏——广场
     */
    @RequestMapping("selectQuestion")
    public AjaxResult selectQuestion(@RequestBody PageQuery pageQuery) {
        List<AppGoodMessageListRes> appGoodMessageListRes = appGoodMessageService.squareList(pageQuery, getUserId(), true);
        return success(appGoodMessageListRes);
    }

    /**
     * 查询收藏——攻略
     */
    @RequestMapping("selectIntroduction")
    public AjaxResult selectIntroduction(@RequestBody PageQuery pageQuery) {
        List<AppArticleListRes> resList = appArticleService.squareList(pageQuery, getUserId(), true);
        return success(resList);
    }
}
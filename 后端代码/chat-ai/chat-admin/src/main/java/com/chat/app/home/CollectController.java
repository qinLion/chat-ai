package com.chat.app.home;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.system.domain.AppCollect;
import com.chat.system.domain.query.FeedBackQuery;
import com.chat.system.domain.query.FeedBackQueryList;
import com.chat.system.service.IAppCollectService;
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
    private IAppCollectService collectService;

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
        collectService.save(appCollect);
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
            collectService.save(appCollect);
            resCount.add(appCollect.getId());
        }
        return success(resCount);
    }

    /**
     * 取消收藏
     */
    @GetMapping("remove")
    public AjaxResult remove(@RequestParam("id") Integer id) {
        Assert.isTrue(id != null, "收藏id不能为空");
        collectService.removeById(id);
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
        collectService.remove(queryWrapper);
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
        List<AppCollect> list = collectService.list(queryWrapper);
        return success(list);
    }

}
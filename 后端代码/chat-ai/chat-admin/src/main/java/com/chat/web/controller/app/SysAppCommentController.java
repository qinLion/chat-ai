package com.chat.web.controller.app;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.AppComment;
import com.chat.system.domain.AppCommentLog;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.query.AppCommentListQuery;
import com.chat.system.domain.res.SysAppCommentRes;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCommentLogService;
import com.chat.system.service.IAppCommentService;
import com.chat.system.service.IAppGoodMessageService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户信息
 *
 * @author chat
 */
@RestController
@RequestMapping("/system/app/comment")
public class SysAppCommentController extends BaseController {

    @Resource
    private IAppCommentService appCommentService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;

    @Resource
    private IAppCommentLogService appCommentLogService;

    /**
     * 获取评论列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppCommentListQuery commentListQuery) {
        startPage();
        List<SysAppCommentRes> lis = appCommentService.sysCommentList(commentListQuery);
        return getDataTable(lis);
    }

    /**
     * 删除评论
     */
    @GetMapping("/del")
    public AjaxResult list(@RequestParam("id") Integer id) {
        // 查询该条评论
        AppComment byId = appCommentService.getById(id);
        // 删除该条评论
        appCommentService.removeById(id);
        // 删除子评论
        // 查询子评论的数量
        QueryWrapper<AppComment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("to_comment_id", id);
        // 子评论列表
        List<AppComment> list = appCommentService.list(queryWrapper);
        // 子评论数量
        int count = list.size();
        // 删除
        appCommentService.remove(queryWrapper);
        // 子评论的id集合
        List<Integer> ids = list.stream().map(AppComment::getId).collect(Collectors.toList());
        // 减少广场或者攻略的评论次数
        Integer commentId = byId.getCommentId();
        if (byId.getType().equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage appGoodMessage = appGoodMessageService.getById(commentId);
            appGoodMessage.setCommentCount(appGoodMessage.getCommentCount() - 1 - count);
            appGoodMessageService.updateById(appGoodMessage);
        } else {
            AppArticle appArticle = appArticleService.getById(commentId);
            appArticle.setCommentCount(appArticle.getCommentCount() - 1 - count);
            appArticleService.updateById(appArticle);
        }
        // 删除评论日志表
        // 需要删除的id集合
        ids.add(id);
        QueryWrapper<AppCommentLog> logQueryWrapper = new QueryWrapper<>();
        logQueryWrapper.in("comment_id", ids);
        appCommentLogService.remove(logQueryWrapper);
        return success();
    }

}

package com.chat.app.square;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.MessageReadType;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.*;
import com.chat.system.domain.query.AppCommentAddQuery;
import com.chat.system.domain.res.AppCommentListRes;
import com.chat.system.domain.res.AppCommentListResAll;
import com.chat.system.domain.res.AppCommentListResChildren;
import com.chat.system.domain.res.AppCommentListResChildrenRes;
import com.chat.system.service.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/comment")
public class CommentController extends APPController {

    @Resource
    private IAppCommentService appCommentService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppCommentLogService appCommentLogService;

    /**
     * 评论列表
     */
    @RequestMapping("/list")
    public AjaxResult list(@RequestBody PageQuery pageQuery) {
        Integer userId = getUserId();
        List<AppCommentListRes> re = appCommentService.commentList(pageQuery, userId);
        QueryWrapper<AppComment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("comment_id", pageQuery.getId());
        queryWrapper.eq("type", pageQuery.getType());
        long count = appCommentService.count(queryWrapper);
        AppCommentListResAll appCommentListResAll = new AppCommentListResAll();
        appCommentListResAll.setTotal(count);
        appCommentListResAll.setList(re);
        return success(appCommentListResAll);
    }

    /**
     * 评论——针对于提问或者攻略
     */
    @RequestMapping("/add")
    public AjaxResult add(@RequestBody AppCommentAddQuery appGoodMessageAddQuery) {
        Integer cUserId = getUserId();
        AppComment appComment = new AppComment();
        appComment.setUserId(cUserId);
        appComment.setCommentId(appGoodMessageAddQuery.getId());
        appComment.setCommentUserId(appGoodMessageAddQuery.getUserId());
        appComment.setIsContent(appGoodMessageAddQuery.getCommentObject());
        appComment.setType(appGoodMessageAddQuery.getType());
        appComment.setContent(appGoodMessageAddQuery.getContent());
        appComment.setIsRead(MessageReadType.noRead.getCode());
        appComment.setCreateTime(new Date());
        appCommentService.save(appComment);
        // 增加记录
        if (appGoodMessageAddQuery.getType().equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage byId = appGoodMessageService.getById(appGoodMessageAddQuery.getId());
            byId.setCommentCount(byId.getCommentCount() + 1);
            appGoodMessageService.updateById(byId);
            // 增加评论记录
            // 写问题的人，即to_user_id
            Integer userId = byId.getUserId();
            AppCommentLog appCommentLog = new AppCommentLog();
            appCommentLog.setFromUserId(cUserId);
            appCommentLog.setToUserId(userId);
            appCommentLog.setCommentType(SupportOrCommentFrom.supportOrComment.getCode());
            appCommentLog.setCommentId(appComment.getId());
            appCommentLog.setIsRead(1);
            appCommentLog.setType(CollectTypeEnum.gc.getCode());
            appCommentLog.setCreateTime(new Date());
            appCommentLog.setCommentIdReal(byId.getId());
            appCommentLogService.save(appCommentLog);
        } else {
            AppArticle byId = appArticleService.getById(appGoodMessageAddQuery.getId());
            byId.setCommentCount(byId.getCommentCount() + 1);
            appArticleService.updateById(byId);
        }
        return success(appComment.getId());
    }

    /**
     * 评论——针对于用户的评论
     */
    @RequestMapping("/addComment")
    public AjaxResult add(@RequestParam("id") Integer id, @RequestParam("content") String content) {
        AppComment byId = appCommentService.getById(id);
        // 不可以对子评论进行评论
        if (byId.getToCommentId() != null) {
            return success();
        }
        AppComment appComment = new AppComment();
        appComment.setUserId(getUserId());
        appComment.setCommentId(byId.getCommentId());
        appComment.setCommentUserId(byId.getUserId());
        appComment.setIsContent(SupportOrCommentFrom.user.getCode());
        appComment.setType(byId.getType());
        appComment.setContent(content);
        appComment.setIsRead(MessageReadType.noRead.getCode());
        appComment.setCreateTime(new Date());
        appComment.setToCommentId(id);
        appCommentService.save(appComment);
        // 增加评论记录
        // 写问题的人，即to_user_id
        Integer userId = byId.getUserId();
        AppCommentLog appCommentLog = new AppCommentLog();
        appCommentLog.setFromUserId(getUserId());
        appCommentLog.setToUserId(userId);
        appCommentLog.setCommentType(SupportOrCommentFrom.user.getCode());
        appCommentLog.setIsRead(1);
        appCommentLog.setCreateTime(new Date());
        appCommentLog.setCommentId(appComment.getId());
        appCommentLog.setCommentIdReal(byId.getCommentId());
        // 增加记录
        if (byId.getType().equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage byId1 = appGoodMessageService.getById(byId.getCommentId());
            byId1.setCommentCount(byId1.getCommentCount() + 1);
            appGoodMessageService.updateById(byId1);
            appCommentLog.setType(CollectTypeEnum.gc.getCode());
        } else {
            AppArticle byId1 = appArticleService.getById(byId.getCommentId());
            byId1.setCommentCount(byId1.getCommentCount() + 1);
            appArticleService.updateById(byId1);
            appCommentLog.setType(CollectTypeEnum.gl.getCode());
        }
        appCommentLogService.save(appCommentLog);
        return success(appComment.getId());
    }

    /**
     * 评论的列表——子评论
     */
    @RequestMapping("/childrenList")
    public AjaxResult childrenList(@RequestParam("id") Integer id, @RequestParam("startIndex") Integer startIndex, @RequestParam("size") Integer size) {
        AppCommentListResChildrenRes res = new AppCommentListResChildrenRes();

        QueryWrapper<AppComment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("to_comment_id", id);
        queryWrapper.orderByDesc("id");
        long count = appCommentService.count(queryWrapper);

        List<AppCommentListResChildren> children = new ArrayList<>();
        QueryWrapper<AppComment> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("to_comment_id", id);
        queryWrapper1.orderByDesc("id");
        queryWrapper1.last("limit " + (startIndex - 1) + " , " + size);
        List<AppComment> list = appCommentService.list(queryWrapper1);

        // 组装子评论的数据
        for (AppComment appComment : list) {
            AppCommentListResChildren children1 = new AppCommentListResChildren();
            Integer userId1 = appComment.getUserId();
            AppUser byId = appUserService.getById(userId1);
            children1.setUserId(byId.getId());
            children1.setContent(appComment.getContent());
            children1.setNickname(byId.getNickname());
            children1.setId(appComment.getId());
            children.add(children1);
        }

        res.setTotal(count);
        res.setList(children);
        return success(res);
    }

}

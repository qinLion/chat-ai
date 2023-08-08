package com.chat.app.square;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.MessageReadType;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.system.domain.*;
import com.chat.system.service.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

@RestController
@RequestMapping("/app/support")
public class SupportController extends APPController {

    @Resource
    private IAppSupportService appSupportService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppCommentService appCommentService;

    @Resource
    private IAppArticleService appArticleService;

    @Resource
    private IAppSupportLogService appSupportLogService;

    /**
     * 点赞——问题跟攻略
     */
    @RequestMapping("/add")
    public AjaxResult add(@RequestParam("id") Integer id, @RequestParam("type") Integer type) {
        Integer cUserId = getUserId();

        // 防止重复点赞
        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("support_id", id);
        queryWrapper.eq("user_id", cUserId);
        queryWrapper.eq("type", type);
        queryWrapper.eq("support_to", SupportOrCommentFrom.supportOrComment.getCode());

        long count = appSupportService.count(queryWrapper);
        if (count > 0) {
            return success();
        }
        AppSupport appSupport = new AppSupport();
        appSupport.setSupportId(id);
        appSupport.setType(type);
        appSupport.setUserId(cUserId);
        appSupport.setCreateTime(new Date());
        appSupport.setIsRead(MessageReadType.noRead.getCode());
        appSupport.setSupportTo(SupportOrCommentFrom.supportOrComment.getCode());
        // 说明是点赞的广场或者攻略
        if (type.equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage byId = appGoodMessageService.getById(id);
            byId.setSupportCount(byId.getSupportCount() + 1);
            appGoodMessageService.updateById(byId);

            // 问题的人，即to_user_id
            Integer userId = byId.getUserId();
            AppSupportLog appSupportLog = new AppSupportLog();
            appSupportLog.setToUserId(userId);
            appSupportLog.setFromUserId(cUserId);
            appSupportLog.setCommentType(SupportOrCommentFrom.supportOrComment.getCode());
            appSupportLog.setType(CollectTypeEnum.gc.getCode());
            appSupportLog.setCommentId(byId.getId());
            appSupportLog.setIsRead(1);
            appSupportLog.setCommentIdReal(byId.getId());
            appSupportLog.setCreateTime(new Date());
            appSupportLogService.save(appSupportLog);
        } else {
            AppArticle byId = appArticleService.getById(id);
            byId.setSupportCount(byId.getSupportCount() + 1);
            appArticleService.updateById(byId);
        }
        appSupportService.save(appSupport);
        return success();
    }

    /**
     * 取消赞——问题跟攻略
     */
    @RequestMapping("/cancel")
    public AjaxResult cancel(@RequestParam("id") Integer id, @RequestParam("type") Integer type) {
        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", getUserId());
        queryWrapper.eq("type", type);
        queryWrapper.eq("support_id", id);
        queryWrapper.eq("support_to", SupportOrCommentFrom.supportOrComment.getCode());
        boolean remove = appSupportService.remove(queryWrapper);
        if (remove && type.equals(CollectTypeEnum.gc.getCode())) {
            // 取消赞减1
            AppGoodMessage byId = appGoodMessageService.getById(id);
            byId.setSupportCount(byId.getSupportCount() - 1);
            appGoodMessageService.updateById(byId);

            // 删除
            QueryWrapper<AppSupportLog> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("comment_id", id);
            queryWrapper1.eq("from_user_id", getUserId());
            queryWrapper1.eq("type", CollectTypeEnum.gc.getCode());
            appSupportLogService.remove(queryWrapper1);
        }
        if (remove && type.equals(CollectTypeEnum.gl.getCode())) {
            // 取消赞减1
            AppArticle byId = appArticleService.getById(id);
            byId.setSupportCount(byId.getSupportCount() - 1);
            appArticleService.updateById(byId);
        }
        return success();
    }


    /**
     * 点赞——针对用户的回复
     *
     * @param id 评论的id
     */
    @RequestMapping("/addComment")
    public AjaxResult add(@RequestParam("id") Integer id) {
        Integer userId = getUserId();

        AppComment byId = appCommentService.getById(id);
        // 防止重复点赞
        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("comment_id", id);
        queryWrapper.eq("user_id", userId);
        long count = appSupportService.count(queryWrapper);
        if (count > 0) {
            return success();
        }

        AppSupport appSupport = new AppSupport();
        appSupport.setType(byId.getType());
        appSupport.setSupportUserId(byId.getUserId());
        appSupport.setSupportTo(SupportOrCommentFrom.user.getCode());
        appSupport.setCreateTime(new Date());
        appSupport.setIsRead(MessageReadType.noRead.getCode());
        appSupport.setUserId(userId);
        appSupport.setSupportId(byId.getCommentId());
        appSupport.setCommentId(id);
        appSupportService.save(appSupport);

        // 问题的人，即to_user_id
        AppSupportLog appSupportLog = new AppSupportLog();
        appSupportLog.setToUserId(byId.getUserId());
        appSupportLog.setFromUserId(userId);
        appSupportLog.setCommentType(SupportOrCommentFrom.user.getCode());
        appSupportLog.setType(byId.getType());
        appSupportLog.setCommentId(byId.getId());
        appSupportLog.setCommentIdReal(byId.getCommentId());
        appSupportLog.setIsRead(1);
        appSupportLog.setCreateTime(new Date());
        appSupportLogService.save(appSupportLog);
        return success();
    }

    /**
     * 取消点赞——针对用户的回复
     *
     * @param id 评论的id
     */
    @RequestMapping("/cancelComment")
    public AjaxResult cancelComment(@RequestParam("id") Integer id) {

        AppComment byId = appCommentService.getById(id);

        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("comment_id", id);
        queryWrapper.eq("user_id", getUserId());
        appSupportService.remove(queryWrapper);


        // 删除
        QueryWrapper<AppSupportLog> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("comment_id", byId.getId());
        queryWrapper1.eq("from_user_id", getUserId());
        queryWrapper1.eq("type", byId.getType());
        appSupportLogService.remove(queryWrapper1);
        return success();
    }

}

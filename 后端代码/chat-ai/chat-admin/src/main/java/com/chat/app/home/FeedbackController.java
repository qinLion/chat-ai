package com.chat.app.home;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.AppComment;
import com.chat.system.domain.AppFeedback;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCommentService;
import com.chat.system.service.IAppFeedbackService;
import com.chat.system.service.IAppGoodMessageService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

@RestController
@RequestMapping("/app/feedback")
public class FeedbackController extends APPController {

    @Resource
    private IAppFeedbackService appFeedbackService;

    @Resource
    private IAppCommentService appCommentService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;

    /**
     * 提交反馈
     */
    @RequestMapping("add")
    public AjaxResult add(@RequestParam("content") String content) {
        Integer userId = getUserId();
        AppFeedback appFeedback = new AppFeedback();
        appFeedback.setContent(content);
        appFeedback.setCreateTime(new Date());
        appFeedback.setUserId(userId);
        appFeedback.setType(0);
        appFeedback.setTopic("系统反馈");
        appFeedbackService.save(appFeedback);
        return success();
    }

    /**
     * 提交反馈
     */
    @RequestMapping("addSquare")
    public AjaxResult addSquare(@RequestParam("id") Integer id, @RequestParam("content") String content) {
        Integer userId = getUserId();

        AppGoodMessage appGoodMessage = appGoodMessageService.getById(id);

        AppFeedback appFeedback = new AppFeedback();
        appFeedback.setContent(content);
        appFeedback.setCreateTime(new Date());
        appFeedback.setUserId(userId);
        appFeedback.setType(1);
        appFeedback.setTopic(appGoodMessage.getUserMessageContent());
        appFeedbackService.save(appFeedback);
        return success();
    }

    /**
     * 提交反馈——针对于提问跟攻略的评论
     */
    @RequestMapping("addOther")
    public AjaxResult addOther(@RequestParam("id") Integer id, @RequestParam("content") String content) {
        Integer userId = getUserId();
        AppComment byId = appCommentService.getById(id);

        Integer commentId = byId.getCommentId();
        Integer type = byId.getType();

        AppFeedback appFeedback = new AppFeedback();

        if (type.equals(CollectTypeEnum.gc.getCode())) {
            AppGoodMessage appGoodMessage = appGoodMessageService.getById(commentId);
            appFeedback.setTopic(appGoodMessage.getUserMessageContent());
        } else {
            AppArticle appArticle = appArticleService.getById(commentId);
            appFeedback.setTopic(appArticle.getTitle());
        }
        appFeedback.setType(byId.getType() - 1);
        appFeedback.setUserId(userId);
        appFeedback.setCreateTime(new Date());
        appFeedback.setContent(content);
        appFeedback.setCommentContent(byId.getContent());
        appFeedback.setCommentId(byId.getId());

        appFeedbackService.save(appFeedback);
        return success();
    }

}

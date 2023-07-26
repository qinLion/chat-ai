package com.chat.app.home;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.system.domain.AppFeedback;
import com.chat.system.service.IAppFeedbackService;
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
        appFeedbackService.save(appFeedback);
        return success();
    }

}

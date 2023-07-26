package com.chat.web.controller.app;

import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;
import com.chat.system.domain.res.SysAppUserRes;
import com.chat.system.service.IAppFeedbackService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户信息
 *
 * @author chat
 */
@RestController
@RequestMapping("/system/app/feedback")
public class SysAppFeedBackController extends BaseController {

    @Resource
    private IAppFeedbackService appFeedbackService;

    /**
     * 获取反馈列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppMessageListQuery user) {
        startPage();
        List<SysAppFeedbackRes> lis = appFeedbackService.sysFeedbackList(user);
        return getDataTable(lis);
    }

    /**
     * 删除反馈
     */
    @GetMapping("/delete")
    public AjaxResult delete(@RequestParam("id") Integer id) {
        appFeedbackService.removeById(id);
        return success();
    }

}

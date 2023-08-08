package com.chat.app.user;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppCommentLog;
import com.chat.system.domain.AppNotiRead;
import com.chat.system.domain.AppSupportLog;
import com.chat.system.domain.SysNotice;
import com.chat.system.domain.res.AppNoticeCommentRes;
import com.chat.system.domain.res.AppNoticeNoReadRes;
import com.chat.system.domain.res.AppNoticeSupportRes;
import com.chat.system.service.IAppCommentLogService;
import com.chat.system.service.IAppNotiReadService;
import com.chat.system.service.IAppSupportLogService;
import com.chat.system.service.ISysNoticeService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/app/notice")
public class NoticeController extends APPController {

    @Resource
    private IAppCommentLogService appCommentLogService;

    @Resource
    private IAppSupportLogService appSupportLogService;

    @Resource
    private ISysNoticeService sysNoticeService;

    @Resource
    private IAppNotiReadService appNotiReadService;

    /**
     * 评论/回复的消息以及列表
     */
    @RequestMapping("/comment")
    public AjaxResult comment(@RequestBody PageQuery pageQuery) {
        Integer userId = getUserId();
        List<AppNoticeCommentRes> res = appCommentLogService.commentNotice(pageQuery, userId);
        return success(res);
    }

    /**
     * 赞的消息列表
     */
    @RequestMapping("/support")
    public AjaxResult support(@RequestBody PageQuery pageQuery) {
        Integer userId = getUserId();
        List<AppNoticeSupportRes> res = appSupportLogService.supportNotice(pageQuery, userId);
        return success(res);
    }

    /**
     * 系统消息列表
     */
    @RequestMapping("/system")
    public AjaxResult system(@RequestBody PageQuery pageQuery) {
        PageHelper.startPage(pageQuery.getPageNum(), pageQuery.getPageSize());
        List<SysNotice> sysNotices = sysNoticeService.selectNoticeList();
        return success(sysNotices);
    }

    /**
     * 查询未读的数量
     */
    @RequestMapping("noRead")
    public AjaxResult noRead() {
        Integer userId = getUserId();
        AppNoticeNoReadRes appNoticeNoReadRes = new AppNoticeNoReadRes();

        // 评论未读
        QueryWrapper<AppCommentLog> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_read", 1);
        queryWrapper.eq("to_user_id", userId);
        long count = appCommentLogService.count(queryWrapper);

        // 赞未读
        QueryWrapper<AppSupportLog> logQueryWrapper = new QueryWrapper<>();
        logQueryWrapper.eq("is_read", 1);
        logQueryWrapper.eq("to_user_id", userId);
        long count1 = appSupportLogService.count(logQueryWrapper);

        // 系统消息未读
        QueryWrapper<AppNotiRead> supportLogQueryWrapper = new QueryWrapper<>();
        supportLogQueryWrapper.eq("user_id", userId);
        AppNotiRead one = appNotiReadService.getOne(supportLogQueryWrapper);

        // 系统消息的数量
        int size = sysNoticeService.selectNoticeList().size();
        if (one == null) {
            appNoticeNoReadRes.setSystem(size);
        } else {
            appNoticeNoReadRes.setSystem(size - one.getNoticeId());
        }
        appNoticeNoReadRes.setComment(count);
        appNoticeNoReadRes.setSupport(count1);
        return success(appNoticeNoReadRes);
    }

    /**
     * 全部已读
     * type:0、评论；1、赞；2、系统消息
     */
    @RequestMapping("read")
    public AjaxResult read(@RequestParam("type") Integer type) {
        Integer userId = getUserId();
        if (type == 0) {
            QueryWrapper<AppCommentLog> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("to_user_id", userId);
            AppCommentLog appCommentLog = new AppCommentLog();
            appCommentLog.setIsRead(0);
            appCommentLogService.update(appCommentLog, queryWrapper);
        } else if (type == 1) {
            QueryWrapper<AppSupportLog> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("to_user_id", userId);
            AppSupportLog appSupportLog = new AppSupportLog();
            appSupportLog.setIsRead(0);
            appSupportLogService.update(appSupportLog, queryWrapper);
        } else {
            int size = sysNoticeService.selectNoticeList().size();
            QueryWrapper<AppNotiRead> supportLogQueryWrapper = new QueryWrapper<>();
            supportLogQueryWrapper.eq("user_id", userId);
            AppNotiRead one = appNotiReadService.getOne(supportLogQueryWrapper);
            if (one == null) {
                one = new AppNotiRead();
                one.setUserId(userId);
                one.setNoticeId(size);
                appNotiReadService.save(one);
            } else {
                one.setNoticeId(size);
                appNotiReadService.updateById(one);
            }
        }
        return success();
    }

}

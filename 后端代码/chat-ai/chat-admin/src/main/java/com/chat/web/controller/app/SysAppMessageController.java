package com.chat.web.controller.app;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppMessageRes;
import com.chat.system.service.IAppGoodMessageService;
import com.chat.system.service.IAppMessageService;
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
@RequestMapping("/system/app/message")
public class SysAppMessageController extends BaseController {

    @Resource
    private IAppMessageService appMessageService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    /**
     * 获取聊天列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppMessageListQuery user) {
        startPage();
        List<SysAppMessageRes> lis = appMessageService.sysList(user);
        return getDataTable(lis);
    }

    /**
     * 删除聊天列表
     */
    @GetMapping("/delete")
    public AjaxResult delete(@RequestParam("id") Integer id) {
        appMessageService.removeById(id);
        // 删除消息
        QueryWrapper<AppGoodMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_message_id", id);
        appGoodMessageService.remove(queryWrapper);
        return success();
    }


}

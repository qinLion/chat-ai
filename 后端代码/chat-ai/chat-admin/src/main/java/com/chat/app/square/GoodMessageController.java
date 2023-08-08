package com.chat.app.square;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.query.AppGoodMessageAddQuery;
import com.chat.system.domain.res.AppGoodMessageListRes;
import com.chat.system.service.IAppCollectService;
import com.chat.system.service.IAppGoodMessageService;
import com.chat.system.service.IAppSupportService;
import com.chat.system.service.IAppUserService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/app/goodMessage")
public class GoodMessageController extends APPController {

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private IAppSupportService appSupportService;

    /**
     * 发现——广场（最新提问）
     */
    @RequestMapping("/list")
    public AjaxResult list(@RequestBody PageQuery pageQuery) {
        Integer userId = getUserId();
        List<AppGoodMessageListRes> re = appGoodMessageService.squareList(pageQuery, userId, false);
        return success(re);
    }

    /**
     * 根据提问的id查看提问的详情
     */
    @RequestMapping("/byId")
    public AjaxResult byId(@RequestParam("id") Integer id) {

        Integer cUserId = getUserId();

        AppGoodMessageListRes appGoodMessageListRes = new AppGoodMessageListRes();
        AppGoodMessage appGoodMessage = appGoodMessageService.getById(id);
        Integer userId = appGoodMessage.getUserId();
        AppUser appUser = appUserService.getById(userId);

        // 组装
        appGoodMessageListRes.setId(appGoodMessage.getId());
        appGoodMessageListRes.setNickname(appUser.getNickname());
        appGoodMessageListRes.setPhoto(appUser.getPhoto());
        appGoodMessageListRes.setCollectCount(appGoodMessage.getCollectCount());
        appGoodMessageListRes.setCommentCount(appGoodMessage.getCommentCount());
        appGoodMessageListRes.setForwardCount(appGoodMessage.getForwardCount());
        appGoodMessageListRes.setSupportCount(appGoodMessage.getSupportCount());
        appGoodMessageListRes.setUserMessageContent(appGoodMessage.getUserMessageContent());
        appGoodMessageListRes.setCreateTime(DateUtils.dateToString(appGoodMessage.getCreateTime()));

        // 判断当前用户有没有收藏过
        appGoodMessageListRes.isCollect = appCollectService.isCollect(cUserId, CollectTypeEnum.gc.getCode(), appGoodMessage.getId());
        // 判断当前用户有没有点赞过
        appGoodMessageListRes.isSupport = appSupportService.isSupport(cUserId, CollectTypeEnum.gc.getCode(), appGoodMessage.getId(), SupportOrCommentFrom.supportOrComment.getCode(), null);

        return success(appGoodMessageListRes);
    }

    /**
     * 用户转发自己的消息
     */
    @RequestMapping("/add")
    public AjaxResult add(@RequestBody AppGoodMessageAddQuery appGoodMessageAddQuery) {
        Integer userId = getUserId();
        appGoodMessageService.add(userId, appGoodMessageAddQuery);
        return success();
    }


}

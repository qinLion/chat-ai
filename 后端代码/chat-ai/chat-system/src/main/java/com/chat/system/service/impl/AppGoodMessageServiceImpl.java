package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.MessageSendType;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.common.utils.SensitiveUtil;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.AppMessage;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.query.AppGoodMessageAddQuery;
import com.chat.system.domain.res.AppGoodMessageListRes;
import com.chat.system.mapper.AppGoodMessageMapper;
import com.chat.system.service.*;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Service
@Slf4j
public class AppGoodMessageServiceImpl extends ServiceImpl<AppGoodMessageMapper, AppGoodMessage> implements IAppGoodMessageService {

    @Resource
    private AppGoodMessageMapper appGoodMessageMapper;

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppMessageService appMessageService;

    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private IAppSupportService appSupportService;


    /**
     * 获取所有的Id
     */
    @Override
    public List<Integer> getAllId() {
        return appGoodMessageMapper.getAllId();
    }

    /**
     * 判断敏感词
     *
     * @param userContent 判断的内容
     */
    @Override
    public int sensitive(String userContent) {
        try {
            return SensitiveUtil.main(userContent);
        } catch (Exception e) {
            return 1;
        }
    }

    /**
     * 广场列表
     *
     * @param flag 为ture代表查询登录用户自己的，为false代表查看所有
     */
    @Override
    public List<AppGoodMessageListRes> squareList(PageQuery pageQuery, Integer cUserId, boolean flag) {
        List<AppGoodMessageListRes> re = new ArrayList<>();
        int count = (int) this.count();
        if (count <= 0) {
            return re;
        }
        // 进行分页
        PageHelper.startPage(pageQuery.getPageNum(), pageQuery.getPageSize());
        List<AppGoodMessage> appGoodMessages;
        if (flag) {
            appGoodMessages = appGoodMessageMapper.userList(cUserId);
        } else {
            QueryWrapper<AppGoodMessage> queryWrapper = new QueryWrapper<>();
            if (pageQuery.getNewOrHot() == 1) {
                queryWrapper.orderByDesc("support_count");
            } else {
                queryWrapper.orderByDesc("id");
            }
            appGoodMessages = this.list(queryWrapper);
        }

        // 查出所有用户
        List<Integer> userIdList = appGoodMessages.stream().map(AppGoodMessage::getUserId).collect(Collectors.toList());
        if (userIdList.size() == 0) {
            return re;
        }
        List<AppUser> appUsers = appUserService.listByIds(userIdList);
        // 组装数据
        for (AppGoodMessage appGoodMessage : appGoodMessages) {
            AppGoodMessageListRes appGoodMessageListRes = new AppGoodMessageListRes();
            Integer userId = appGoodMessage.getUserId();
            AppUser appUser = appUsers.stream().filter(item -> item.getId().equals(userId)).collect(Collectors.toList()).get(0);

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
            re.add(appGoodMessageListRes);
        }
        return re;
    }

    /**
     * 转发自己的消息
     */
    @Override
    public void add(Integer userId, AppGoodMessageAddQuery appGoodMessageAddQuery) {
        // 查询消息的Id
        String userContent = appGoodMessageAddQuery.getUserContent();
        // 判断包含敏感词吗，包含的话直接跳过
        int sensitive = this.sensitive(userContent);
        if (sensitive == 1) {
            return;
        }
        QueryWrapper<AppMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("content", userContent);
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("send_type", MessageSendType.user.getCode());
        queryWrapper.orderByDesc("create_time");
        List<AppMessage> list = appMessageService.list(queryWrapper);
        if (list.size() <= 0) {
            return;
        }
        Integer id = list.get(0).getId();
        saveGoodMessage(userId, userContent, appGoodMessageAddQuery.getAiContent(), id + "");
    }

    // 对消息进行记录
    public void saveGoodMessage(Integer userId, String user, String ai, String messageId) {
        AppGoodMessage appGoodMessage = new AppGoodMessage();
        appGoodMessage.setUserId(userId);
        appGoodMessage.setUserMessageId(Integer.parseInt(messageId));
        appGoodMessage.setUserMessageContent(user);
        appGoodMessage.setAiMessageContent(ai);
        appGoodMessage.setCreateTime(new Date());
        appGoodMessage.setCollectCount(0);
        appGoodMessage.setCommentCount(0);
        appGoodMessage.setSupportCount(0);
        appGoodMessage.setForwardCount(0);
        this.save(appGoodMessage);
    }

}

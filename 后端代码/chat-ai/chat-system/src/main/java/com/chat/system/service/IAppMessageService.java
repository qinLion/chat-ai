package com.chat.system.service;

import com.chat.system.domain.AppMessage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.query.ChatMessageQuery;
import com.chat.system.domain.res.SysAppMessageRes;
import com.theokanning.openai.completion.chat.ChatMessage;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
public interface IAppMessageService extends IService<AppMessage> {

    /**
     * 消息的预处理，包括积分校验、消息存储
     */
    String messageHandle(ChatMessageQuery chatMessageQuery);

    /**
     * 对消息进行组装
     */
    List<ChatMessage> chatMessageList(ChatMessageQuery chatMessageQuery);

    /**
     * 获取消息列表
     */
    List<SysAppMessageRes> sysList(AppMessageListQuery user);
}

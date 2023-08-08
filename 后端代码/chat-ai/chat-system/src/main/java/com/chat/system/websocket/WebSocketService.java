package com.chat.system.websocket;

import com.alibaba.fastjson.JSON;
import com.chat.common.config.RedisKeyConfig;
import com.chat.common.core.redis.RedisCache;
import com.chat.common.enums.MessageSendType;
import com.chat.common.enums.MessageStatus;
import com.chat.common.enums.MessageType;
import com.chat.common.utils.ApplicationContextUtil;
import com.chat.common.utils.spring.SpringUtils;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.AppMessage;
import com.chat.system.domain.query.ChatMessageQuery;
import com.chat.system.openai.OpenAiChatBiz;
import com.chat.system.service.IAppGoodMessageService;
import com.chat.system.service.IAppMessageService;
import com.chat.system.service.impl.AppMessageServiceImpl;
import com.theokanning.openai.completion.chat.ChatMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@ServerEndpoint("/websocket/{terminalId}")
public class WebSocketService {

    public final Logger logger = LoggerFactory.getLogger(WebSocketService.class);


    /**
     * 保存连接信息
     */
    public static Map<String, Session> CLIENTS = new ConcurrentHashMap<>();

    /**
     * 保存连接信息
     */
    public static Map<Session, String> sessionToToken = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(@PathParam("terminalId") String terminalId, Session session) {
        logger.info(session.getRequestURI().getPath() + "，打开连接开始：" + session.getId());

        //当前连接已存在，关闭
        if (CLIENTS.containsKey(terminalId)) {
            onClose(CLIENTS.get(terminalId));
        }

        CLIENTS.put(terminalId, session);
        sessionToToken.put(session, terminalId);
        logger.info(session.getRequestURI().getPath() + "，打开连接完成：" + session.getId());
    }

    @OnClose
    public void onClose(@PathParam("terminalId") String terminalId, Session session) {
        logger.info(session.getRequestURI().getPath() + "，关闭连接开始：" + session.getId());

        CLIENTS.remove(terminalId);
        sessionToToken.remove(session);

        logger.info(session.getRequestURI().getPath() + "，关闭连接完成：" + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        logger.info("前台发送消息：" + message);
        // 1、对消息进行校验以及判断积分、使用天数、消息存储
        ChatMessageQuery chatMessageQuery = JSON.parseObject(message, ChatMessageQuery.class);
        chatMessageQuery.setToken(sessionToToken.get(session));
        IAppMessageService messageService = (IAppMessageService) ApplicationContextUtil.getBean("appMessageServiceImpl");
        String s = messageService.messageHandle(chatMessageQuery);
        if (s.startsWith(AppMessageServiceImpl.systemTip)) {
            // 如果剩余次数、非会员都没有的话就不去发
            // this.sendMessage(s, session);
            // 发送完毕、关闭websocket
            onClose(session);
            sessionToToken.remove(session);
            CLIENTS.remove(chatMessageQuery.getToken());
            return;
        }
        // 2、对消息进行组装
        List<ChatMessage> chatMessages = messageService.chatMessageList(chatMessageQuery);
        // 3、调用openai
        OpenAiChatBiz openAiChatBiz = (OpenAiChatBiz) ApplicationContextUtil.getBean("openAiChatBiz");
        String chat = openAiChatBiz.chat(chatMessages, session);
        RedisCache redisCache = SpringUtils.getBean("redisCache");
        Integer userId = redisCache.getCacheObject(RedisKeyConfig.appUser + chatMessageQuery.getToken());
        logger.info("对于用户id:{},提出的问题是：{}，回答的问题是{}", userId, chatMessageQuery.getContent(), chat);
        // 4、将返回的数据进行存储
        saveAiMessage(chat, userId, messageService, chatMessageQuery);
        // 5、对消息进行记录
        if (chatMessageQuery.getContent().length() >= 15 && chat.length() > 3) {
            // saveGoodMessage(userId, chatMessageQuery, chat, s);
        }
        // 6、不管是用户主动断开还是发送完毕的断开，消息发送完毕都要断开连接
        onClose(session);
        sessionToToken.remove(session);
        CLIENTS.remove(chatMessageQuery.getToken());
    }

    @OnError
    public void onError(Throwable error) {
        logger.error(error.toString());
    }

    public void onClose(Session session) {
        try {
            session.close();
        } catch (IOException e) {
            logger.error("关闭连接异常：" + e);
        }
    }

    public void sendMessage(String message, Session session) {
        try {
            if (CLIENTS.containsValue(session)) {
                session.getBasicRemote().sendText(message);
            }
        } catch (Exception e) {
            logger.error("推送异常：" + e);
        }
    }

    public boolean sendMessage(String terminalId, String message) {
        try {
            Session session = CLIENTS.get(terminalId);
            session.getAsyncRemote().sendText(message);
            logger.info("推送成功：" + message);
            return true;
        } catch (Exception e) {
            logger.error("推送异常：" + e);
            return false;
        }
    }

    // 将返回的数据进行存储
    public void saveAiMessage(String chat, Integer userId, IAppMessageService messageService, ChatMessageQuery chatMessageQuery) {
        if (!chat.equals("")) {
            AppMessage message1 = new AppMessage();
            message1.setUserId(userId);
            message1.setSendType(MessageSendType.ai.getCode());
            message1.setStatus(MessageStatus.OK.getCode());
            message1.setContent(chat);
            if (chatMessageQuery.getType() == null) {
                message1.setType(MessageType.chat.getCode());
            } else {
                message1.setType(chatMessageQuery.getType());
            }
            message1.setCreateTime(new Date());
            messageService.save(message1);
        }
    }

    // 对消息进行记录
    public void saveGoodMessage(Integer userId, ChatMessageQuery chatMessageQuery, String chat, String messageId) {
        IAppGoodMessageService goodMessageService = (IAppGoodMessageService) ApplicationContextUtil.getBean("appGoodMessageServiceImpl");
        AppGoodMessage appGoodMessage = new AppGoodMessage();
        appGoodMessage.setUserId(userId);
        appGoodMessage.setUserMessageId(Integer.parseInt(messageId));
        appGoodMessage.setUserMessageContent(chatMessageQuery.getContent());
        appGoodMessage.setAiMessageContent(chat);
        appGoodMessage.setCreateTime(new Date());
        appGoodMessage.setCollectCount(0);
        appGoodMessage.setCommentCount(0);
        appGoodMessage.setSupportCount(0);
        appGoodMessage.setForwardCount(0);
        goodMessageService.save(appGoodMessage);
    }

}

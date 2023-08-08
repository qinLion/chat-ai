package com.chat.system.domain.query;

import lombok.Data;

import java.io.Serializable;

@Data
public class ChatMessageQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息的类型
     * 1、聊天
     * 2、写日报
     * 3、翻译
     * 4、解题
     * 5、编程助手
     * 6、写文章
     * 7、写诗歌
     * 8、写小红书体文案
     * 9、下厨房
     * 10、星座专家
     */
    private Integer type = 1;

    /**
     * 消息发送方
     */
    private String token;

    /**
     * 消息发送的内容
     */
    private String content;

    /**
     * 字数控制，类型为2时生效
     * 例：50字以内、50-100字、100-200字、200字以上
     */
    private String tip;

    /**
     * 翻译的语言，只有类型为3时生效
     */
    private String languages;

}

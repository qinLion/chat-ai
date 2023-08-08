package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;

@Data
public class SysAppCommentRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String phone;

    private String nickname;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 板块 2、广场 3、攻略
     */
    private Integer type;

    private String createTime;

    /**
     * 主题
     */
    private String topic;

    /**
     * 广场或者攻略的id
     */
    private String commentId;

}

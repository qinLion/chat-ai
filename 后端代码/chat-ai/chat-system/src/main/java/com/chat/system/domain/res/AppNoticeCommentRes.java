package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;

@Data
public class AppNoticeCommentRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名字
     */
    private String name;

    /**
     * 头像
     */
    private String photo;

    /**
     * 评论时间
     */
    private String createTime;

    /**
     * 评论内容
     */
    private String commentContent;

    /**
     * 评论的id
     */
    private Integer commentId;

    /**
     * 提问或者攻略的内容
     */
    private String content;

    /**
     * 提问或者攻略的内容的时间
     */
    private String contentTime;

    /**
     * 提问或者攻略的id
     */
    private Integer id;

    /**
     * 提问或者攻略的类型
     * 2、提问；3攻略
     */
    private Integer type;

}

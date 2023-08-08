package com.chat.system.domain.query;

import lombok.Data;

import java.io.Serializable;

@Data
public class AppCommentAddQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 评论的对象：1、问题、2、用户
     */
    private Integer commentObject = 1;

    /**
     * 评论的类型：2、广场、3攻略
     */
    private Integer type;

    /**
     * 评论的内容
     */
    private String content;

    /**
     * 评论的用户的id
     * 评论的对象为用户时需要传
     */
    private Integer userId;

    /**
     * id(提问或者攻略的id)
     */
    private Integer id;
}

package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;

@Data
public class AppNoticeNoReadRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名字
     */
    private Long comment;

    /**
     * 头像
     */
    private Long support;

    /**
     * 评论时间
     */
    private Integer system;


}

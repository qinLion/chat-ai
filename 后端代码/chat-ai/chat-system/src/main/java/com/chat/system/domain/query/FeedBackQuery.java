package com.chat.system.domain.query;

import lombok.Data;

import java.io.Serializable;

@Data
public class FeedBackQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的提问内容
     */
    private String userContent;

    /**
     * ai的回答内容
     */
    private String aiContent;
}

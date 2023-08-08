package com.chat.common.enums;

/**
 * 点赞或者评论的来源
 *
 * @author chat
 */
public enum SupportOrCommentFrom {
    supportOrComment(1, "问题或攻略"), user(2, "用户");

    private final Integer code;
    private final String info;

    SupportOrCommentFrom(Integer code, String info) {
        this.code = code;
        this.info = info;
    }

    public Integer getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}

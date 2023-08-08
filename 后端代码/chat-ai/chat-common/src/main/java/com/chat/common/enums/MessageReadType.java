package com.chat.common.enums;

/**
 * 用户状态
 *
 * @author chat
 */
public enum MessageReadType {
    read(0, "已读"), noRead(1, "未读");

    private final Integer code;
    private final String info;

    MessageReadType(Integer code, String info) {
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

package com.chat.common.enums;

/**
 * 用户状态
 *
 * @author chat
 */
public enum MessageSendType {
    user(0, "代表用户发送"), ai(1, "代表机器人发送");

    private final Integer code;
    private final String info;

    MessageSendType(Integer code, String info) {
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

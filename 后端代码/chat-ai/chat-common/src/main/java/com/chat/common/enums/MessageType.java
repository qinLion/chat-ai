package com.chat.common.enums;

/**
 * 用户状态
 *
 * @author chat
 */
public enum MessageType {
    chat(1, "聊天"), DELETED(1, "删除");

    private final Integer code;
    private final String info;

    MessageType(Integer code, String info) {
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

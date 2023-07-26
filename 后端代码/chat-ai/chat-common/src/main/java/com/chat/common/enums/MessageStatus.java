package com.chat.common.enums;

/**
 * 用户状态
 *
 * @author chat
 */
public enum MessageStatus {
    OK(0, "正常"), DELETED(1, "删除");

    private final Integer code;
    private final String info;

    MessageStatus(Integer code, String info) {
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

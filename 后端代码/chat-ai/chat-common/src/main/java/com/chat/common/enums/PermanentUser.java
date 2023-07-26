package com.chat.common.enums;

/**
 * 用户状态
 *
 * @author chat
 */
public enum PermanentUser {
    permanent(0, "终身会员"), noPermanent(1, "非终身会员");

    private final Integer code;
    private final String info;

    PermanentUser(Integer code, String info) {
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

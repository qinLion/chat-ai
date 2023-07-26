package com.chat.common.enums;

import lombok.Getter;

@Getter
public enum VipConfigEnum {
    /**
     * 终身会员
     */
    all(80000, "终身会员"),

    /**
     * 包年会员
     */
    year(365, "包年会员"),

    /**
     * 包季会员
     */
    quarter(91, "包季会员"),

    /**
     * 包月会员
     */
    month(30, "包月会员"),

    /**
     * 周会员
     */
    week(7, "周会员"),

    ;
    private final Integer code;
    private final String text;

    VipConfigEnum(Integer code, String text) {
        this.code = code;
        this.text = text;
    }

    public static VipConfigEnum codeOf(Integer code) {
        VipConfigEnum[] enumConstants = VipConfigEnum.class.getEnumConstants();
        for (VipConfigEnum t : enumConstants) {
            if (t.getCode().equals(code)) {
                return t;
            }
        }
        return null;
    }

    public static VipConfigEnum textOf(String text) {
        VipConfigEnum[] enumConstants = VipConfigEnum.class.getEnumConstants();
        for (VipConfigEnum t : enumConstants) {
            if (t.getText().equals(text)) {
                return t;
            }
        }
        return null;
    }

}
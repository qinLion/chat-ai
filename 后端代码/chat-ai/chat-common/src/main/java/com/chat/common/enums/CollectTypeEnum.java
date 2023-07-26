package com.chat.common.enums;

import lombok.Getter;

@Getter
public enum CollectTypeEnum {
    /**
     * 聊天
     */
    chat(1, "聊天"),

    /**
     * 广场
     */
    gc(2, "广场"),

    /**
     * 攻略
     */
    gl(3, "攻略"),

    ;
    private final Integer code;
    private final String text;

    CollectTypeEnum(Integer code, String text) {
        this.code = code;
        this.text = text;
    }

    public static CollectTypeEnum codeOf(Integer code) {
        CollectTypeEnum[] enumConstants = CollectTypeEnum.class.getEnumConstants();
        for (CollectTypeEnum t : enumConstants) {
            if (t.getCode().equals(code)) {
                return t;
            }
        }
        return null;
    }

    public static CollectTypeEnum textOf(String text) {
        CollectTypeEnum[] enumConstants = CollectTypeEnum.class.getEnumConstants();
        for (CollectTypeEnum t : enumConstants) {
            if (t.getText().equals(text)) {
                return t;
            }
        }
        return null;
    }

}
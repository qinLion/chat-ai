package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;

@Data
public class AppVipRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 名字
     */
    private String name;

    /**
     * 金额
     */
    private String amount;

    /**
     * 首冲送天数
     */
    private Integer addDay;

    /**
     * 每天多少金额
     */
    private String dayAmount;

}

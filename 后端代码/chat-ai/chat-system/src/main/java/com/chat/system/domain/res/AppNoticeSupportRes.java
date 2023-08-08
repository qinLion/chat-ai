package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class AppNoticeSupportRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名字
     */
    private List<String> nameList;

    /**
     * 头像
     */
    private List<String> photoList;

    /**
     * 赞时间
     */
    private String createTime;

    /**
     * 赞的个数
     */
    private Integer supportCount;

    /**
     * 提问或者攻略的内容
     */
    private String content;

    /**
     * 提问或者攻略的内容的时间
     */
    private String contentTime;

    /**
     * 提问或者攻略的id
     */
    private Integer id;

    /**
     * 提问或者攻略的类型
     * 2、提问；3攻略
     */
    private Integer type;

}

package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class AppNoticeSupportMapperRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名字
     */
    private String name;

    /**
     * 头像
     */
    private String photo;

    /**
     * 赞时间
     */
    private String createTime;

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

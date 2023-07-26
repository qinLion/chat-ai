package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysAppFeedbackRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String phone;

    private String nickname;

    private String content;

    /**
     * 0意见反馈 1、广场 2攻略
     */
    private Integer type = 0;

    private Date createTime;

    private String createTimeString;

    private String topic = "系统反馈";

}

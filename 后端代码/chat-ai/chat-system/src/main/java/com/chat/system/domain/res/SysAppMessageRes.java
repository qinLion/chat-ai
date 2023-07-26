package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysAppMessageRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String phone;

    private String nickname;

    private String content;

    private Date createTime;

    private String createTimeString;

}

package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysAppUserRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String phone;

    private String nickname;

    private Integer sex;

    private Date createTime;

    private String createTimeString;

    private Date expireTime;

    private Integer userType;

    private Integer vipType;

    private Integer count;

    private String vipId;

    private Integer isAvailable;
}

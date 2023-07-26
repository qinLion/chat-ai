package com.chat.system.domain.query;

import com.chat.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

@Data
public class AppUserListQuery extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String phone;

    /**
     * 0、全部、1普通用户、2订阅用户
     */
    private Integer userType;

    /**
     * 0、全部；1、永久；2、包年；3、包季；4、包月；5、7天
     */
    private Integer vipType;

    private String vipString;

    private String startTime;
    private String endTime;

    private Date nowDate = new Date();

}

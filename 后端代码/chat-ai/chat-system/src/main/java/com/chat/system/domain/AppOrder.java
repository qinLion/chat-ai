package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_order")
public class AppOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer userId;

    private String vipId;

    /**
     * 订单状态、0未支付、1已支付
     */
    private Integer payStatus;

    /**
     * 订单的id
     */
    private String orderId;

    /**
     * 创建时间
     */
    private Date createTime;


}

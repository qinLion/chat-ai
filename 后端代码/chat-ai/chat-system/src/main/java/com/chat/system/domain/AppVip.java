package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_vip")
public class AppVip implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id")
    private Integer id;

    private String productId;

    /**
     * 名字
     */
    @TableField("name")
    private String name;

    /**
     * 金额（单位分）
     */
    @TableField("amount")
    private Integer amount;

    /**
     * 首冲送会员天数
     */
    @TableField("add_day")
    private Integer addDay;

    /**
     * 折合一天多少钱（单位分）
     */
    @TableField("day_amount")
    private Integer dayAmount;

    /**
     * 是否启用，0启动、1不启用
     */
    @TableField("is_use")
    private Integer isUse;


}

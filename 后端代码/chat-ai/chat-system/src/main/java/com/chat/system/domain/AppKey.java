package com.chat.system.domain;

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
 * @since 2023-07-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_key")
public class AppKey implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * key
     */
    private String keyValue;

    /**
     * 0正常、1异常
     */
    private Integer status;

    /**
     * 0开启使用、1禁止使用
     */
    private Integer useStatus;


}

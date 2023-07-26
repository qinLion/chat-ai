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
 * @since 2023-07-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_message")
public class AppMessage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息的id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 消息发送的类型（0代表用户发的，1代表机器人发的）
     */
    private Integer sendType;

    /**
     * 消息的类型1、聊天
     */
    private Integer type;

    /**
     * 消息的内容
     */
    private String content;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 消息的状态0正常1删除
     */
    private Integer status;


}

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
 * @since 2023-07-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_support")
public class AppSupport implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 点赞的id
     */
    private Integer supportId;

    /**
     * 点赞的类型：1、广场、2、攻略
     */
    private Integer type;

    /**
     * 0、已读、1、未读
     */
    private Integer isRead;

    /**
     * 点赞的用户的id，主要用于评论的时候点赞
     */
    private Integer supportUserId;

    /**
     * 点赞的来源，1、问题或攻略、2、用户
     */
    private Integer supportTo;

    /**
     * 点赞的时间
     */
    private Date createTime;

    /**
     * 评论的Id
     */
    private Integer commentId;



}

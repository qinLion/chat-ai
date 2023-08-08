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
 * @since 2023-07-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_support_log")
public class AppSupportLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 来源的用户的id
     */
    private Integer fromUserId;

    /**
     * 点赞的用户的id
     */
    private Integer toUserId;

    /**
     * 2广场、3攻略
     */
    private Integer type;

    /**
     * 如果点赞的类型是广场或攻略、那么此id代表的就是广场或者攻略的id
     * 如果点赞的类型是用户的评论，那么此id代表的就是用户评论的id
     */
    private Integer commentId;

    /**
     * 点赞的类型。1、提问或者广场，2、用户的评论
     */
    private Integer commentType;

    /**
     * 0已读、1未读
     */
    private Integer isRead;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 评论或者广场的id（真实的）
     */
    private Integer commentIdReal;

}

package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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
@TableName("app_comment_log")
public class AppCommentLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 来源的用户的id
     */
    private Integer fromUserId;

    /**
     * 评论的用户的id
     */
    private Integer toUserId;

    /**
     * 2广场、3攻略
     */
    private Integer type;

    /**
     * 如果评论的类型是广场或攻略、那么此id代表的就是广场或者攻略的id
     * 如果评论的类型是用户的评论，那么此id代表的就是用户评论的id
     */
    private Integer commentId;

    /**
     * 评论的类型。1、提问或者广场，2、用户的评论
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

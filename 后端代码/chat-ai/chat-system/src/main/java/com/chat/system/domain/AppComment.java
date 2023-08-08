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
@TableName("app_comment")
public class AppComment implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 评论的消息的id
     */
    private Integer commentId;

    /**
     * 评论的类型：1、广场、2攻略
     */
    private Integer type;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 评论的对象：1、问题、2、用户
     */
    private Integer isContent;

    /**
     * 评论的用户的id
     */
    private Integer commentUserId;

    /**
     * 评论的内容
     */
    private String content;

    /**
     * 是否已读 0已读、1、未读
     */
    private Integer isRead;

    /**
     * 回复的评论的id
     */
    private Integer toCommentId;

    /**
     * 创建时间
     */
    private Date createTime;


}

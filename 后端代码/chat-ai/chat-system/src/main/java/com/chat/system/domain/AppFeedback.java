package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_feedback")
public class AppFeedback implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 反馈的Id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 反馈的内容
     */
    private String content;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 0意见反馈 1、广场 2攻略
     */
    private Integer type;

    /**
     * 举报的评论的id
     */
    private Integer commentId;

    /**
     * 举报的评论的内容
     */
    private String commentContent;

    /**
     * 主题
     */
    private String topic;

    /**
     * 创建时间
     */
    private Date createTime;

}

package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
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
@TableName("app_good_message")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppGoodMessage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 用户的消息
     */
    private String userMessageContent;

    /**
     * 用户的消息id
     */
    private Integer userMessageId;

    /**
     * ai回答的消息
     */
    private String aiMessageContent;

    /**
     * 评论的数量
     */
    private Integer commentCount;

    /**
     * 点赞的数量
     */
    private Integer supportCount;

    /**
     * 收藏的数量
     */
    private Integer collectCount;

    /**
     * 转发的数量
     */
    private Integer forwardCount;

    /**
     * 创建的时间
     */
    private Date createTime;


}

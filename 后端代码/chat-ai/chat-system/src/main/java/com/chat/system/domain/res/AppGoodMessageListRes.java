package com.chat.system.domain.res;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Data
public class AppGoodMessageListRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 名字
     */
    private String nickname;

    /**
     * 头像
     */
    private String photo;

    /**
     * userContent
     */
    private String userMessageContent;

    /**
     * 创建时间
     */
    private String createTime;

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
     * 当前用户是否点赞
     */
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    public boolean isSupport;

    /**
     * 当前用户是否收藏
     */
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    public boolean isCollect;

}

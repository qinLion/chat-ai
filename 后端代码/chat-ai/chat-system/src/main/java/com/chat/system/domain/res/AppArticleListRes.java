package com.chat.system.domain.res;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Data
public class AppArticleListRes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 图片
     */
    //private List<String> photos;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 评论的数量
     */
    private Integer commentCount;

    /**
     * 评论的数量
     */
    private Integer readCount;

    /**
     * 点赞的数量
     */
    private Integer supportCount;

    /**
     * 收藏的数量
     */
    private Integer collectCount;

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

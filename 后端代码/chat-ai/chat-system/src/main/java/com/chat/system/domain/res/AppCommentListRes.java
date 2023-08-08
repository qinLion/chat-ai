package com.chat.system.domain.res;

import lombok.*;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppCommentListRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户评论的id
     */
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
     * 用户的id
     */
    private Integer userId;

    /**
     * 点赞的数量
     */
    private Integer supportCount;

    /**
     * 是否点赞
     */
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    public boolean isSupport;

    /**
     * 回答的内容
     */
    private String content;

    /**
     * 回答的时间
     */
    private String createTime;

    /**
     * 子评论的数量
     */
    private Integer childrenCount;

    /**
     * 子评论
     */
    private List<AppCommentListResChildren> children;

}

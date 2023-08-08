package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class AppCommentListResChildren implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 名字
     */
    private String nickname;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 回答的内容
     */
    private String content;

    /**
     * 子评论的id
     */
    private Integer id;


}

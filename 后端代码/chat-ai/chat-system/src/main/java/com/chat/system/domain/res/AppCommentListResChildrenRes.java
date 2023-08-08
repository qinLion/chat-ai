package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class AppCommentListResChildrenRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 多少条
     */
    private Long total;

    /**
     * 子评论列表
     */
    private List<AppCommentListResChildren> list;


}

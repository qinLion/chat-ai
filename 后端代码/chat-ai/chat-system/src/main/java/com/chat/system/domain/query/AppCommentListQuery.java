package com.chat.system.domain.query;

import com.chat.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class AppCommentListQuery extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String name;

    private String content;
}

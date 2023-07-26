package com.chat.system.domain.query;

import com.chat.common.core.domain.BaseEntity;
import lombok.Data;

@Data
public class AppArticleListQuery extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String title;

}

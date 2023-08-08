package com.chat.system.domain.res;

import lombok.*;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppCommentListResAll implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的总数量
     */
    private Long total;


    private List<AppCommentListRes> list;

}

package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Data
public class AppRecommendRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 推荐问题说明
     */
    private String content;

    /**
     * 推荐问题列表，为空说明没有
     */
    private List<String> children;


}

package com.chat.system.mapper;

import com.chat.system.domain.AppFeedback;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
public interface AppFeedbackMapper extends BaseMapper<AppFeedback> {

    List<SysAppFeedbackRes> sysFeedbackList(AppMessageListQuery user);
}

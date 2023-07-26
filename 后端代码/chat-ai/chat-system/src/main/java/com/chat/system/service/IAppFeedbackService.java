package com.chat.system.service;

import com.chat.system.domain.AppFeedback;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
public interface IAppFeedbackService extends IService<AppFeedback> {

    List<SysAppFeedbackRes> sysFeedbackList(AppMessageListQuery user);
}

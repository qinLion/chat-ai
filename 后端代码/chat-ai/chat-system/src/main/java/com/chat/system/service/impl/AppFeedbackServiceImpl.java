package com.chat.system.service.impl;

import com.chat.common.utils.DateUtils;
import com.chat.system.domain.AppFeedback;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;
import com.chat.system.mapper.AppFeedbackMapper;
import com.chat.system.service.IAppFeedbackService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
@Service
public class AppFeedbackServiceImpl extends ServiceImpl<AppFeedbackMapper, AppFeedback> implements IAppFeedbackService {

    @Resource
    private AppFeedbackMapper appFeedbackMapper;

    @Override
    public List<SysAppFeedbackRes> sysFeedbackList(AppMessageListQuery user) {
        List<SysAppFeedbackRes> res = appFeedbackMapper.sysFeedbackList(user);
        for (SysAppFeedbackRes re : res) {
            re.setCreateTimeString(DateUtils.dateToString(re.getCreateTime()));
        }
        return res;
    }
}

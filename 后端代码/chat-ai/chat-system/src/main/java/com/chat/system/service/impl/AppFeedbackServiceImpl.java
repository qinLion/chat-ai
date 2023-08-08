package com.chat.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.utils.DateUtils;
import com.chat.system.domain.AppFeedback;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.res.SysAppFeedbackRes;
import com.chat.system.mapper.AppFeedbackMapper;
import com.chat.system.service.IAppFeedbackService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 服务实现类
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
            if (!re.getType().equals(0)) {
                if (StringUtils.isNotEmpty(re.getCommentContent())){
                    re.setContent(re.getCommentContent() + "(" + re.getContent() + ")");
                }
            }
        }
        return res;
    }
}

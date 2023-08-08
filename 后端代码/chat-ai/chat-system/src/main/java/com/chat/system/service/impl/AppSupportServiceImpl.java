package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.system.domain.AppSupport;
import com.chat.system.mapper.AppSupportMapper;
import com.chat.system.service.IAppSupportService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-29
 */
@Service
public class AppSupportServiceImpl extends ServiceImpl<AppSupportMapper, AppSupport> implements IAppSupportService {

    /**
     * 判断用户是否点赞过
     */
    @Override
    public boolean isSupport(Integer userId, Integer type, Integer supportId, Integer supportTo, Integer supportUserId) {
        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("type", type);
        queryWrapper.eq("support_id", supportId);
        queryWrapper.eq("support_to", supportTo);
        if (supportUserId != null) {
            queryWrapper.eq("support_user_id", supportUserId);
        }
        List<AppSupport> list = this.list(queryWrapper);
        return list != null && list.size() > 0;
    }

    /**
     * 评论点赞的数量
     */
    public int commentSupportCount(Integer id) {
        QueryWrapper<AppSupport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("comment_id", id);
        return (int) this.count(queryWrapper);
    }

}

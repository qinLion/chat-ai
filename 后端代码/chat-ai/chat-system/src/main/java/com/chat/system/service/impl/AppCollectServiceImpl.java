package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.system.domain.AppCollect;
import com.chat.system.mapper.AppCollectMapper;
import com.chat.system.service.IAppCollectService;
import org.springframework.stereotype.Service;

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
public class AppCollectServiceImpl extends ServiceImpl<AppCollectMapper, AppCollect> implements IAppCollectService {

    /**
     * 判断有没有收藏过
     */
    @Override
    public boolean isCollect(Integer userId, Integer type, Integer collectId) {
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        queryWrapper.eq("type", type);
        queryWrapper.eq("content_id", collectId);
        List<AppCollect> list = this.list(queryWrapper);
        return list != null && list.size() > 0;
    }
}

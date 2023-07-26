package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.utils.RequestUtil;
import com.chat.system.domain.AppKey;
import com.chat.system.mapper.AppKeyMapper;
import com.chat.system.service.IAppKeyService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-22
 */
@Service
@Slf4j
public class AppKeyServiceImpl extends ServiceImpl<AppKeyMapper, AppKey> implements IAppKeyService {

    @Resource
    private AppKeyMapper appKeyMapper;


    @Override
    @SneakyThrows
    public void test() {
        List<AppKey> appKeys = appKeyMapper.selectList(new QueryWrapper<>());
        for (AppKey appKey : appKeys) {
            String key = appKey.getKeyValue();
            Thread.sleep(200);
            appKey.setStatus(test(key));
            appKeyMapper.updateById(appKey);
        }
    }

    public int test(String key) {
        Map<String, String> map = new HashMap<>();
        map.put("Authorization", "Bearer " + key);
        String s = RequestUtil.sendGetRequestNoParams("https://api.openai.com/v1/models", map);
        if (s == null) {
            return 0;
        }
        if (s.contains("error")) {
            log.info("key为：{}，返回的信息为：{}，不可用", key, s);
            return 1;
        } else {
            log.info("key为：{}，返回的信息为：{}，可用", key, s);
            return 0;
        }
    }
}

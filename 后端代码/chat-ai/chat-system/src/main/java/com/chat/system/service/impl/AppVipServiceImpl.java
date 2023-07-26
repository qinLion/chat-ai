package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.VipConfigEnum;
import com.chat.system.domain.AppVip;
import com.chat.system.domain.res.AppVipRes;
import com.chat.system.mapper.AppVipMapper;
import com.chat.system.service.IAppVipService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-13
 */
@Service
public class AppVipServiceImpl extends ServiceImpl<AppVipMapper, AppVip> implements IAppVipService {

    @Resource
    private AppVipMapper appVipMapper;

    /**
     * 获取会员列表
     */
    @Override
    public List<AppVipRes> getVipList() {
        List<AppVip> list = appVipMapper.selectList(new QueryWrapper<>());
        List<AppVipRes> res = new ArrayList<>();
        for (AppVip appVip : list) {
            AppVipRes appVipRes = new AppVipRes();
            appVipRes.setId(appVip.getProductId());
            appVipRes.setName(appVip.getName());
            appVipRes.setAddDay(appVip.getAddDay());
            appVipRes.setDayAmount(String.format(Locale.ENGLISH, "%.2f", appVip.getDayAmount() / 100.0));
            if (appVip.getAmount().toString().endsWith("00")) {
                appVipRes.setAmount(String.format(Locale.ENGLISH, "%.0f", appVip.getAmount() / 100.0));
            } else {
                appVipRes.setAmount(String.format(Locale.ENGLISH, "%.2f", appVip.getAmount() / 100.0));
            }
            if (!appVip.getName().equals("终身会员") && VipConfigEnum.textOf(appVip.getName()) != null && appVip.getDayAmount().equals(0)) {
                // 天数
                Integer code = VipConfigEnum.textOf(appVip.getName()).getCode();
                // 赠送天数
                Integer addDay = appVip.getAddDay();
                appVipRes.setDayAmount(String.format(Locale.ENGLISH, "%.2f", appVip.getAmount() / 100.0 / (code + addDay)));
            }
            res.add(appVipRes);
        }
        return res;
    }
}

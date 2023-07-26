package com.chat.app.home;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.domain.entity.SysDictData;
import com.chat.common.enums.DeleteOrAvailableStatus;
import com.chat.common.enums.PermanentUser;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.res.AppRecommendRes;
import com.chat.system.mapper.AppUserMapper;
import com.chat.system.mapper.SysDictDataMapper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/home")
public class HomeController extends APPController {

    @Resource
    private AppUserMapper appUserMapper;

    @Resource
    private SysDictDataMapper sysDictDataMapper;

    /**
     * 获取使用人数
     */
    @RequestMapping("useTotal")
    public AjaxResult useTotal() {
        getUserId();
        QueryWrapper<AppUser> wrapper = new QueryWrapper<>();
        wrapper.eq("is_delete", DeleteOrAvailableStatus.OK.getCode());
        Long aLong = appUserMapper.selectCount(wrapper);
        return success(aLong);
    }

    /**
     * 判断该用户是否还有使用天数
     */
    @RequestMapping("canUse")
    public AjaxResult canUse() {
        Integer userId = getUserId();
        AppUser user = appUserMapper.selectById(userId);
        // 判断用户剩余天数及积分
        if (user.getPermanent().equals(PermanentUser.noPermanent.getCode()) && user.getExpireTime().before(new Date()) && user.getCoin() <= 0) {
            return success(1);
        }
        return success(0);
    }

    /**
     * 获取推荐问题
     */
    @RequestMapping("recommend")
    public AjaxResult recommend() {
        List<SysDictData> sys_recommend = sysDictDataMapper.selectDictDataByType("sys_recommend");
        List<AppRecommendRes> recommendRes = new ArrayList<>();
        // 组装数据
        for (SysDictData sysDictData : sys_recommend) {
            AppRecommendRes appRecommendRes = new AppRecommendRes();
            appRecommendRes.setContent(sysDictData.getDictLabel());
            if (!sysDictData.getDictValue().equals("空")){
                // 多条数据
                String[] split = sysDictData.getDictValue().split("\\*");
                List<String> children = new ArrayList<>(Arrays.asList(split));
                appRecommendRes.setChildren(children);
            }else {
                appRecommendRes.setChildren(new ArrayList<>());
            }
            recommendRes.add(appRecommendRes);
        }
        return success(recommendRes);
    }

}

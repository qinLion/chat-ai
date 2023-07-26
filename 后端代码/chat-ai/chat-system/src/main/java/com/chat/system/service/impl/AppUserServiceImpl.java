package com.chat.system.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.config.RedisKeyConfig;
import com.chat.common.core.domain.entity.SysDictData;
import com.chat.common.core.redis.RedisCache;
import com.chat.common.enums.DeleteOrAvailableStatus;
import com.chat.common.enums.PermanentUser;
import com.chat.common.exception.AppExceptionConfig;
import com.chat.common.utils.*;
import com.chat.common.utils.bean.BeanUtils;
import com.chat.system.domain.AppCollect;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.AppVip;
import com.chat.system.domain.query.AppUserListQuery;
import com.chat.system.domain.res.AppUserInfoRes;
import com.chat.system.domain.res.SysAppUserRes;
import com.chat.system.mapper.AppUserMapper;
import com.chat.system.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Service
@Slf4j
public class AppUserServiceImpl extends ServiceImpl<AppUserMapper, AppUser> implements IAppUserService {

    @Value("${platform.jiguang.Authorization}")
    private String Authorization;

    @Value("${platform.jiguang.url}")
    private String url;

    @Value("${platform.jiguang.privateKey}")
    private String privateKey;

    @Resource
    private AppUserMapper appUserMapper;

    @Resource
    private RedisCache redisCache;

    @Resource
    private ISysConfigService sysConfigService;

    @Resource
    private IAppCollectService appCollectService;

    @Resource
    private ISysDictDataService sysDictDataService;

    @Resource
    private IAppVipService appVipService;

    /**
     * 一键登录
     */
    @Override
    public String direct(String loginToken, String inviteCode) {
        // 调用平台获取手机号
        Map<String, String> map = new HashMap<>();
        map.put("loginToken", loginToken);
        map.put("exID", "123456");
        String s = JSON.toJSONString(map);

        // 设置头部
        Map<String, String> header = new HashMap<>();
        header.put("Authorization", "Basic " + Authorization);
        String request = RequestUtil.sendPostRequestByJson(url, s, header);
        JSONObject jsonObject = JSONObject.parseObject(request);

        if (jsonObject.get("code").equals(8000)) {
            // 手机号的加密字符串
            String phone = jsonObject.get("phone").toString();
            // 解密
            String decrypt = RSADecrypt.decrypt(phone, privateKey);
            log.info("解密获取的手机号{}", decrypt);
            // 不存在注册用户，存在登录
            String login = login(decrypt, inviteCode);
            return login;
        } else {
            log.error("获取手机号失败：{}", jsonObject.get("content"));
            Assert.isTrue(false, "获取手机号失败");
        }
        return null;
    }

    /**
     * 验证码登录
     *
     * @param phone 手机号
     * @param code  验证码
     * @return 返回的token
     */
    @Override
    public String code(String phone, String code, String inviteCode) {
        // 对验证码进行校验
        Object cacheObject = redisCache.getCacheObject(RedisKeyConfig.smsCode + phone);
        Assert.isTrue(cacheObject != null, AppExceptionConfig.codeExpire);
        Assert.isTrue(cacheObject.toString().equals(code), AppExceptionConfig.codeError);
        // 检验通过
        String login = login(phone, inviteCode);
        return login;
    }

    /**
     * 通过手机号获取用户的信息
     */
    @Override
    public AppUser getUser(String phone) {
        QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("phone", phone);
        queryWrapper.eq("is_delete", DeleteOrAvailableStatus.OK.getCode());
        return appUserMapper.selectOne(queryWrapper);
    }

    /**
     * 通过邀请码获取用户的信息
     */
    public AppUser getUserByCode(String code) {
        QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("code", code);
        return appUserMapper.selectOne(queryWrapper);
    }

    /**
     * 通过手机号获取用户的信息(包括注销的用户)
     */
    public AppUser getUserAll(String phone) {
        QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("phone", phone);
        return appUserMapper.selectOne(queryWrapper);
    }

    /**
     * 获取用户的信息
     */
    @Override
    public AppUserInfoRes info(Integer id) {
        AppUser user = this.getById(id);
        AppUserInfoRes appUserInfoRes = new AppUserInfoRes();
        BeanUtils.copyProperties(user, appUserInfoRes);
        // 判断是否还有天数
        Date expireTime = user.getExpireTime();
        Date date = new Date();
        Long endTime = expireTime.getTime();
        Long starTime = date.getTime();
        if (endTime - starTime > 0) {
            long num = (endTime - starTime) / 24 / 60 / 60 / 1000;
            appUserInfoRes.setResidueDay((int) num);
        } else {
            appUserInfoRes.setResidueDay(0);
        }
        // 判断是否为会员
        if (user.getPermanent().equals(PermanentUser.permanent.getCode()) || endTime - starTime > 0) {
            appUserInfoRes.setVip(0);
        } else {
            appUserInfoRes.setVip(1);
        }

        // 使用天数
        Long startUse = user.getCreateTime().getTime();
        long useDay = (starTime - startUse) / 24 / 60 / 60 / 1000;
        appUserInfoRes.setUseDay((int) useDay);

        // 获取收藏的数量
        QueryWrapper<AppCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", id);
        long count = appCollectService.count(queryWrapper);
        appUserInfoRes.setCollectCount((int) count);
        return appUserInfoRes;
    }

    /**
     * 获取用户列表
     */
    @Override
    public List<SysAppUserRes> sysUserList(AppUserListQuery user, List<AppVip> list) {

        List<SysAppUserRes> sysAppUserRes = appUserMapper.sysUserList(user);
        for (SysAppUserRes sysAppUserRe : sysAppUserRes) {
            // 判断用户的类型
            if (sysAppUserRe.getExpireTime().before(new Date())) {
                sysAppUserRe.setUserType(1);
            } else {
                sysAppUserRe.setUserType(2);
            }
            String s = DateUtils.dateToString(sysAppUserRe.getCreateTime());
            sysAppUserRe.setCreateTimeString(s);
            // 返回订阅类型
            for (AppVip appVip : list) {
                if (appVip.getProductId().equals(sysAppUserRe.getVipId())) {
                    sysAppUserRe.setVipType(appVip.getId());
                }
            }
            int inviteCount = inviteCount(sysAppUserRe.getId());
            sysAppUserRe.setCount(inviteCount);
        }
        return sysAppUserRes;
    }

    /**
     * 登录注册接口
     */
    private String login(String phone, String inviteCode) {
        AppUser appUser = getUser(phone);
        if (appUser != null) {
            // 判断用户是否被禁用
            if (appUser.getIsAvailable().equals(DeleteOrAvailableStatus.DELETED.getCode())) {
                Assert.isTrue(false, AppExceptionConfig.phoneNotAvailable);
            }
            return saveToken(appUser);
        } else {
            String random = RandomCode.getRandom();
            int i = 0;
            while (i < 3) {
                i++;
                QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("code", random);
                Long aLong = appUserMapper.selectCount(queryWrapper);
                if (aLong > 0) {
                    random = RandomCode.getRandom();
                } else {
                    break;
                }
            }
            // 头像的话随机
            SysDictData sysDictData = new SysDictData();
            sysDictData.setDictType("photo");
            List<SysDictData> sysDictData1 = sysDictDataService.selectDictDataList(sysDictData);
            String photo = "";
            if (sysDictData1.size() > 0) {
                Random random1 = new Random();
                int i1 = random1.nextInt(5);
                photo = sysDictData1.get(i1).getDictValue();
            }
            AppUser user = AppUser.builder()
                    .createTime(new Date())
                    .expireTime(new Date())
                    .isAvailable(DeleteOrAvailableStatus.OK.getCode())
                    .isDelete(DeleteOrAvailableStatus.OK.getCode())
                    .permanent(PermanentUser.noPermanent.getCode())
                    .coin(2)
                    .nickname("AI助手")
                    .phone(phone)
                    .code(random)
                    .photo(photo)
                    .build();
            // 判断inviteCode是否为空
            // 如果该手机号之前已经注册过，不生效
            if (StringUtils.isNotEmpty(inviteCode)) {
                AppUser userAll = getUserAll(phone);
                if (userAll == null) {
                    AppUser userByCode = getUserByCode(inviteCode);
                    if (userByCode != null) {
                        user.setInviteId(userByCode.getId());
                        String key = sysConfigService.selectConfigByKey("app.forward");
                        userByCode.setCoin(userByCode.getCoin() + Integer.parseInt(key));
                        this.updateById(userByCode);
                    }
                }
            }
            this.save(user);
            return saveToken(user);
        }
    }

    private String saveToken(AppUser user) {
        String token = user.getId() + "-" + UUID.randomUUID().toString() + "-" + System.currentTimeMillis();
        // token = Md5Utils.getMd5(token);
        String key = RedisKeyConfig.appUser + token;
        redisCache.setCacheObject(key, user.getId(), 30, TimeUnit.DAYS);
        return token;
    }

    /**
     * 邀请数量
     */
    public int inviteCount(Integer id) {
        QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_delete", 0);
        queryWrapper.eq("invite_id", id);
        Long aLong = appUserMapper.selectCount(queryWrapper);
        return aLong == null ? 0 : aLong.intValue();
    }

    /**
     * 删除userId对应的缓存
     */
    @Override
    public void delRedis(String userIdPre) {
        // 获取所有的key
        Set<String> keys = (Set<String>) redisCache.keys(RedisKeyConfig.appUser + "*");
        for (String key : keys) {
            if (key.startsWith(RedisKeyConfig.appUser + userIdPre + "-")) {
                redisCache.deleteObject(key);
            }
        }
    }
}

package com.chat.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.AppSupportLog;
import com.chat.system.domain.res.AppNoticeSupportMapperRes;
import com.chat.system.domain.res.AppNoticeSupportRes;
import com.chat.system.mapper.AppSupportLogMapper;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppGoodMessageService;
import com.chat.system.service.IAppSupportLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
@Service
@Slf4j
public class AppSupportLogServiceImpl extends ServiceImpl<AppSupportLogMapper, AppSupportLog> implements IAppSupportLogService {

    @Resource
    private AppSupportLogMapper appSupportLogMapper;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;


    /**
     * 赞的消息
     */
    @Override
    public List<AppNoticeSupportRes> supportNotice(PageQuery pageQuery, Integer userId) {
        List<AppNoticeSupportRes> realRes = new ArrayList<>();
        List<AppNoticeSupportMapperRes> res = appSupportLogMapper.supportNotice(userId);
        List<AppNoticeSupportRes> allRes = new ArrayList<>();
        if (res.size() == 0) {
            return realRes;
        }
        for (AppNoticeSupportMapperRes re : res) {
            List<AppNoticeSupportRes> collect = allRes.stream().filter(item -> item.getId().equals(re.getId())).collect(Collectors.toList());
            if (collect.size() > 0) {
                AppNoticeSupportRes appNoticeSupportRes = collect.get(0);
                appNoticeSupportRes.setSupportCount(appNoticeSupportRes.getSupportCount() + 1);
                appNoticeSupportRes.getNameList().add(re.getName());
                appNoticeSupportRes.getPhotoList().add(re.getPhoto());
            } else {
                AppNoticeSupportRes appNoticeSupportRes = new AppNoticeSupportRes();
                appNoticeSupportRes.setId(re.getId());
                appNoticeSupportRes.setType(re.getType());
                appNoticeSupportRes.setCreateTime(re.getCreateTime());
                appNoticeSupportRes.setSupportCount(1);
                appNoticeSupportRes.setNameList(new ArrayList<>(Arrays.asList(re.getName())));
                appNoticeSupportRes.setPhotoList(new ArrayList<>(Arrays.asList(re.getPhoto())));
                allRes.add(appNoticeSupportRes);
            }
        }
        // 手动分页
        // 从第几个开始（包括）
        int start = (pageQuery.getPageNum() - 1) * pageQuery.getPageSize();
        // 到第几个结束（不包括）
        int end = pageQuery.getPageNum() * pageQuery.getPageSize();
        try {
            for (int i = start; i < end; i++) {
                AppNoticeSupportRes appNoticeSupportRes = allRes.get(i);
                realRes.add(appNoticeSupportRes);
            }
        } catch (Exception e) {
            log.info("加不进去了");
        }
        for (AppNoticeSupportRes re : realRes) {
            if (re.getType().equals(CollectTypeEnum.gc.getCode())) {
                AppGoodMessage byId = appGoodMessageService.getById(re.getId());
                // 提问或者攻略的内容
                re.setContent(byId.getUserMessageContent());
                // 提问或者攻略的内容时间
                re.setContentTime(DateUtils.dateToString(byId.getCreateTime()));
            } else {
                AppArticle byId = appArticleService.getById(re.getId());
                // 提问或者攻略的内容
                re.setContent(byId.getContent());
                // 提问或者攻略的内容时间
                re.setContentTime(DateUtils.dateToString(byId.getCreateTime()));
            }
        }
        return realRes;
    }
}

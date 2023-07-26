package com.chat.quartz.task;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.enums.MessageSendType;
import com.chat.common.enums.PermanentUser;
import com.chat.system.domain.AppMessage;
import com.chat.system.domain.AppUser;
import com.chat.system.service.IAppMessageService;
import com.chat.system.service.IAppUserService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 定时任务调度测试
 *
 * @author chat
 */
@Component("ryTask")
public class RyTask {

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppMessageService appMessageService;

    public void everydat() {
        // 每天加免费的聊天次数
        Date date = new Date();
        // 昨天
        Date preDate = new Date(date.getTime() - 24 * 60 * 60 * 1000);
        // 所有用户
        List<AppUser> list = appUserService.list();
        // 昨天的聊天记录
        QueryWrapper<AppMessage> queryWrapper = new QueryWrapper<>();
        queryWrapper.between("create_time", preDate, date);
        queryWrapper.eq("send_type", MessageSendType.user.getCode());
        List<AppMessage> appMessages = appMessageService.list(queryWrapper);

        for (AppUser appUser : list) {
            if (appUser.getPermanent().equals(PermanentUser.permanent.getCode()) || appUser.getExpireTime().after(date)) {
                continue;
            }
            long count = appMessages.stream().filter(item -> item.getUserId().equals(appUser.getId())).count();
            if (count == 1) {
                appUser.setCoin(appUser.getCoin() + 1);
            }
            if (count >= 2) {
                appUser.setCoin(appUser.getCoin() + 2);
            }
        }
        appUserService.updateBatchById(list);
    }
}

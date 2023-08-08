package com.chat.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppArticle;
import com.chat.system.domain.AppCommentLog;
import com.chat.system.domain.AppGoodMessage;
import com.chat.system.domain.res.AppNoticeCommentRes;
import com.chat.system.mapper.AppCommentLogMapper;
import com.chat.system.service.IAppArticleService;
import com.chat.system.service.IAppCommentLogService;
import com.chat.system.service.IAppGoodMessageService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
@Service
public class AppCommentLogServiceImpl extends ServiceImpl<AppCommentLogMapper, AppCommentLog> implements IAppCommentLogService {

    @Resource
    private AppCommentLogMapper appCommentLogMapper;

    @Resource
    private IAppArticleService appArticleService;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    /**
     * 评论/回复的消息
     */
    @Override
    public List<AppNoticeCommentRes> commentNotice(PageQuery pageQuery, Integer userId) {
        PageHelper.startPage(pageQuery.getPageNum(), pageQuery.getPageSize());
        List<AppNoticeCommentRes> res = appCommentLogMapper.commentNotice(userId);
        for (AppNoticeCommentRes re : res) {
            if (re.getType().equals(CollectTypeEnum.gc.getCode())){
                AppGoodMessage byId = appGoodMessageService.getById(re.getId());
                // 提问或者攻略的内容
                re.setContent(byId.getUserMessageContent());
                // 提问或者攻略的内容时间
                re.setContentTime(DateUtils.dateToString(byId.getCreateTime()));
            }else {
                AppArticle byId = appArticleService.getById(re.getId());
                // 提问或者攻略的内容
                re.setContent(byId.getContent());
                // 提问或者攻略的内容时间
                re.setContentTime(DateUtils.dateToString(byId.getCreateTime()));
            }
        }
        return res;
    }
}

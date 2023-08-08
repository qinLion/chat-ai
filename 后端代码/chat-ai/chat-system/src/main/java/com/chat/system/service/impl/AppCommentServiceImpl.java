package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.enums.CollectTypeEnum;
import com.chat.common.enums.SupportOrCommentFrom;
import com.chat.common.utils.DateUtils;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.*;
import com.chat.system.domain.query.AppCommentListQuery;
import com.chat.system.domain.res.AppCommentListRes;
import com.chat.system.domain.res.AppCommentListResChildren;
import com.chat.system.domain.res.SysAppCommentRes;
import com.chat.system.mapper.AppCommentMapper;
import com.chat.system.service.*;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-29
 */
@Service
public class AppCommentServiceImpl extends ServiceImpl<AppCommentMapper, AppComment> implements IAppCommentService {

    @Resource
    private IAppUserService appUserService;

    @Resource
    private IAppSupportService appSupportService;

    @Resource
    private AppCommentMapper appCommentMapper;

    @Resource
    private IAppGoodMessageService appGoodMessageService;

    @Resource
    private IAppArticleService appArticleService;

    /**
     * 评论的列表
     */
    @Override
    public List<AppCommentListRes> commentList(PageQuery pageQuery, Integer userId) {
        PageHelper.startPage(pageQuery.getPageNum(), pageQuery.getPageSize());
        QueryWrapper<AppComment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_content", SupportOrCommentFrom.supportOrComment.getCode());
        queryWrapper.eq("comment_id", pageQuery.getId());
        queryWrapper.eq("type", pageQuery.getType());
        queryWrapper.orderByDesc("id");
        List<AppComment> appCommentList = this.list(queryWrapper);
        // 返回的
        List<AppCommentListRes> re = new ArrayList<>();
        // 查出所有用户
        List<Integer> userIdList = appCommentList.stream().map(AppComment::getUserId).collect(Collectors.toList());
        if (userIdList.size() == 0) {
            return re;
        }
        List<AppUser> appUsers = appUserService.listByIds(userIdList);
        for (AppComment comment : appCommentList) {
            AppUser appUser = appUsers.stream().filter(item -> item.getId().equals(comment.getUserId())).collect(Collectors.toList()).get(0);
            // 组装返回的数据
            AppCommentListRes res = AppCommentListRes.builder()
                    .content(comment.getContent())
                    .createTime(DateUtils.dateToString(comment.getCreateTime()))
                    .userId(comment.getUserId())
                    .nickname(appUser.getNickname())
                    .photo(appUser.getPhoto())
                    .id(comment.getId())
                    .build();
            // 点赞的数量
            int i = appSupportService.commentSupportCount(comment.getId());
            res.setSupportCount(i);
            // 是否点赞
            QueryWrapper<AppSupport> queryWrapper11 = new QueryWrapper<>();
            queryWrapper11.eq("comment_id", comment.getId());
            queryWrapper11.eq("user_id", userId);
            long count = appSupportService.count(queryWrapper11);
            res.isSupport = count > 0;
            // 子评论
            List<AppCommentListResChildren> children = new ArrayList<>();
            QueryWrapper<AppComment> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("to_comment_id", comment.getId());
            queryWrapper1.orderByDesc("id");
            List<AppComment> list = this.list(queryWrapper1);
            res.setChildrenCount(list.size());
            // 组装子评论的数据
            for (AppComment appComment : list) {
                AppCommentListResChildren children1 = new AppCommentListResChildren();
                Integer userId1 = appComment.getUserId();
                AppUser byId = appUserService.getById(userId1);
                children1.setId(appComment.getId());
                children1.setUserId(byId.getId());
                children1.setContent(appComment.getContent());
                children1.setNickname(byId.getNickname());

                children.add(children1);
                if (children.size() >= 2) {
                    break;
                }
            }
            res.setChildren(children);
            re.add(res);
        }
        return re;
    }

    /**
     * 评论列表
     */
    @Override
    public List<SysAppCommentRes> sysCommentList(AppCommentListQuery commentListQuery) {
        List<SysAppCommentRes> reList = appCommentMapper.sysCommentList(commentListQuery);
        for (SysAppCommentRes re : reList) {
            if (re.getType().equals(CollectTypeEnum.gc.getCode())){
                AppGoodMessage byId = appGoodMessageService.getById(re.getCommentId());
                // 提问或者攻略的主题
                re.setTopic(byId.getUserMessageContent());
            }else {
                AppArticle byId = appArticleService.getById(re.getCommentId());
                // 提问或者攻略的主题
                re.setTopic(byId.getTitle());
            }
        }
        return reList;
    }
}

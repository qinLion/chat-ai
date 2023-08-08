package com.chat.system.service;

import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppComment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.system.domain.query.AppCommentListQuery;
import com.chat.system.domain.res.AppCommentListRes;
import com.chat.system.domain.res.SysAppCommentRes;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-29
 */
public interface IAppCommentService extends IService<AppComment> {

    List<AppCommentListRes> commentList(PageQuery pageQuery, Integer userId);

    List<SysAppCommentRes> sysCommentList(AppCommentListQuery commentListQuery);
}

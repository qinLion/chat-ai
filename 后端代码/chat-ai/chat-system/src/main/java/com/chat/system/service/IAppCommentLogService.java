package com.chat.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.common.utils.PageQuery;
import com.chat.system.domain.AppCommentLog;
import com.chat.system.domain.res.AppNoticeCommentRes;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
public interface IAppCommentLogService extends IService<AppCommentLog> {

    List<AppNoticeCommentRes> commentNotice(PageQuery pageQuery, Integer userId);
}

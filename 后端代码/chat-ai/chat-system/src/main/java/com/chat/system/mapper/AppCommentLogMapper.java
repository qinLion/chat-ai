package com.chat.system.mapper;

import com.chat.system.domain.AppCommentLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.res.AppNoticeCommentRes;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-31
 */
public interface AppCommentLogMapper extends BaseMapper<AppCommentLog> {

    List<AppNoticeCommentRes> commentNotice(Integer userId);
}

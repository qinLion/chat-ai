package com.chat.system.mapper;

import com.chat.system.domain.AppComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.system.domain.query.AppCommentListQuery;
import com.chat.system.domain.res.SysAppCommentRes;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-29
 */
public interface AppCommentMapper extends BaseMapper<AppComment> {

    List<SysAppCommentRes> sysCommentList(AppCommentListQuery commentListQuery);

}

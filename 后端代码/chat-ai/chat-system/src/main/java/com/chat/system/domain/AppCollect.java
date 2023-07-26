package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_collect")
public class AppCollect implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏的Id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户的提问内容
     */
    private String userContent;

    /**
     * 返回的聊天内容
     */
    private String aiContent;

    /**
     * 关联的内容的id
     */
    private Integer contentId;

    /**
     * 收藏的类型：1聊天、2广场、3攻略
     */
    private Integer type;

    /**
     * 用户的id
     */
    private Integer userId;

    /**
     * 收藏时间
     */
    private Date createTime;


}

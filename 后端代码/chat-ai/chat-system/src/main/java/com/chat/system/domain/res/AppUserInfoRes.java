package com.chat.system.domain.res;

import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Data
public class AppUserInfoRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的id
     */
    private Integer id;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 头像
     */
    private String photo;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别：0男、1女、2未知
     */
    private Integer sex;

    /**
     * 是否为会员 0为会员、1非会员
     */
    private Integer vip;

    /**
     * 使用天数
     */
    private Integer useDay;

    /**
     * 会员剩余天数，vip为0时有效
     */
    private Integer residueDay;

    /**
     * 收藏的数量
     */
    private Integer collectCount = 0;

    /**
     * 消息的数量
     */
    private Integer messageCount = 0;

    /**
     * 评论的数量
     */
    private Integer commentCount = 0;

    /**
     * 邀请码
     */
    private String code;

}

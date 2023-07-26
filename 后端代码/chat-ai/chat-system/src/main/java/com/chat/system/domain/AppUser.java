package com.chat.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("app_user")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AppUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的id
     */
    @TableId(value = "id", type = IdType.AUTO)
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
     * 剩余聊天次数
     */
    private Integer coin;

    /**
     * 0终身会员、1非终身会员
     */
    private Integer permanent;

    /**
     * 邀请人id
     */
    private Integer inviteId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 过期时间
     */
    private Date expireTime;

    /**
     * 是否已删除、0正常1已删除
     */
    private Integer isDelete;

    /**
     * 是否可用、0正常1不可用
     */
    private Integer isAvailable;

    /**
     * 验证码code
     */
    private String code;


}

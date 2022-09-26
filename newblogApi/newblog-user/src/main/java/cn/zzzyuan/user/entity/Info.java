package cn.zzzyuan.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户信息表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user_info")
public class Info implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    private String name;

    /**
     * 加密后密码
     */
    private String password;

    /**
     * 用户头像图片链接
     */
    private String avatar;

    /**
     * 用户性别
     */
    private Boolean sex;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 账号创建时间
     */
    private LocalDateTime createTime;


    /**
     * 最后登录时间
     */
    private LocalDateTime lastTime;

    /**
     * 最后登录ip
     */
    private String lastIp;

    /**
     * 扩展预留字段1
     */
    private String extend1;

    /**
     * 扩展预留字段1
     */
    private String extend2;


}

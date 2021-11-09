package cn.zzzyuan.entity.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户全部信息整合
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO implements Serializable {


    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private Integer id;

    /**
     * 用户名
     */
    private String name;


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
    @NotBlank(message = "邮箱不能为空")
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
     * 用户经验值
     */
    private Integer experience;

    /**
     * 帖子总数
     */
    private Integer postNum;

    /**
     * 博客url
     */
    private String blogUrl;

    /**
     * 个人签名
     */
    private String sign;

    /**
     * 是否展示邮箱
     */
    private Integer showMail;

}

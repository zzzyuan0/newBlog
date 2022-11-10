package cn.zzzyuan.user.entity.dto;

import lombok.Data;

import javax.validation.constraints.*;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-02
 */
@Data
public class RegisterDTO {

    /**
     * 注册用户名
     */
    @NotBlank(message = "用户名不能为空")
    @Size(min = 3,max = 20)
    private String name;

    /**
     * 注册邮箱
     */
    @NotBlank(message = "邮箱不能为空")
    @Email
    private String email;
    /**
     * 注册密码
     */
    @NotBlank(message = "密码不能为空")
    @Size(min = 6,max = 20)
    private String password;

    /**
     * 重复密码
     */
    @NotBlank(message = "重复密码不能为空")
    private String rePassword;

    /**
     * 验证码
     */
    @NotBlank(message = "验证码不能为空")
    private String code;
}

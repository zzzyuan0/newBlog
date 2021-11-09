package cn.zzzyuan.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 登录邮箱
     */
    @NotBlank(message = "邮箱不能为空")
    private String email;
    /**
     * 登录密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;
    /**
     * 登录ip
     */
    private String lastIp;

}

package cn.zzzyuan.common.entity;

import com.alibaba.fastjson.support.spring.annotation.ResponseJSONP;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-03
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class Token {

    /**
    * token 秘钥
     */
    @JsonProperty("access_token")
    private String accessToken;

    /**
     * token 类型
     */
    @JsonProperty("token_type")
    private String tokenType;

    /**
     * 刷新token
     */
    @JsonProperty("refresh_token")
    private String refreshToken;

    /**
    *  token 有效期
    * */
    @JsonProperty("expires_in")
    private int expiresIn;

    /**
    * token 作用域
    * */
    private String scope;


}

package cn.zzzyuan.user.feign;


import cn.zzzyuan.common.entity.Token;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-16
 */
@FeignClient(name = "newblog-auth")
@Component
@RequestMapping("/auth")
public interface AuthFeign {

    /**
     * 请求auth服务获取对应token
    * @param req  请求参数
    * @RequestParam 将参数拼接
    */
    @PostMapping("/oauth/token")
    Token getOauthToken(@RequestParam HashMap<String, String> req);

    /**
     *  远程调用检查token是否正确
     *  @param req  请求体
     *
     * */
    @GetMapping("/oauth/check_token")
    HashMap<String, Object> checkOauthToken(@RequestParam HashMap<String, String> req);

}

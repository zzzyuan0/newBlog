package cn.zzzyuan.user.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.common.entity.Token;
import cn.zzzyuan.user.feign.AuthFeign;
import cn.zzzyuan.user.service.TokenService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-14
 */
@Service
@Slf4j
public class TokenServiceImpl implements TokenService {

    @Value("${oauth.url}")
    private  String url;

    @Value("${oauth.client_id}")
    private  String clientId;

    @Value("${oauth.client_secret}")
    private  String clientSecret;

    @Value("${oauth.grant_type}")
    private  String grantType;

    @Value("${oauth.scope}")
    private  String scope;

    private final RestTemplate restTemplate;

    private final AuthFeign authFeign;

    public TokenServiceImpl(RestTemplate restTemplate, AuthFeign authFeign) {
        this.restTemplate = restTemplate;
        this.authFeign = authFeign;
    }


    @Override
    public Token getToken(String username, String password) {
        HashMap<String, String> valueMap = new LinkedHashMap<>();
        valueMap.put("username", username);
        valueMap.put("password",password);
        valueMap.put("grant_type", grantType);
        valueMap.put("client_id", clientId);
        valueMap.put("client_secret", clientSecret);
        valueMap.put("scope", scope);
        Token oauthToken = authFeign.getOauthToken(valueMap);
        return oauthToken;
    }
}

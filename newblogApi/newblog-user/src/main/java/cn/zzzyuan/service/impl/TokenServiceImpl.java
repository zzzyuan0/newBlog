package cn.zzzyuan.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.zzzyuan.common.entity.Token;
import cn.zzzyuan.service.TokenService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

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

    @Autowired
    private RestTemplate restTemplate;


    @Override
    public Token getToken(String username, String password) {
        MultiValueMap<String, String> valueMap = new LinkedMultiValueMap<>();
        valueMap.set("username", username);
        valueMap.set("password",password);
        valueMap.set("grant_type", grantType);
        valueMap.set("client_id", clientId);
        valueMap.set("client_secret", clientSecret);
        valueMap.set("scope", scope);
        Object jsonObject = restTemplate.postForObject(url, valueMap, Object.class);
        Token token = new Token();
        BeanUtil.copyProperties(jsonObject,token);
        return token;
    }
}

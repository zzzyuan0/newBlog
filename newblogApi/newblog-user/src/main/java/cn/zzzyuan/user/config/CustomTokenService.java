package cn.zzzyuan.user.config;

import cn.zzzyuan.user.feign.AuthFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.AccessTokenConverter;
import org.springframework.security.oauth2.provider.token.DefaultAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 重写RemoteTokenServices，使用openfei来进行远程调用
 * @author codesuperman@foxmail.com
 * @date 2022-11-16
 */

@Service
class CustomTokenService extends RemoteTokenServices {


    @Value("${oauth.check_url}")
    private String checkTokenEndpointUrl;

    @Value("${oauth.client_id}")
    private String clientId;

    @Value("${oauth.client_secret}")
    private String clientSecret;

    private String tokenName = "token";

    private AccessTokenConverter tokenConverter = new DefaultAccessTokenConverter();

    @Autowired
    private AuthFeign authFeign;

    @Override
    public OAuth2Authentication loadAuthentication(String accessToken) throws AuthenticationException, InvalidTokenException {

        HashMap<String, String> req = new HashMap<String, String>(1);
        req.put(tokenName, accessToken);
        // 使用openfei进行调用，不依赖对应url
        Map<String, Object> map = authFeign.checkOauthToken(req);

        if (map.containsKey("error")) {
            logger.debug("check_token returned error: " + map.get("error"));
            throw new InvalidTokenException(accessToken);
        }

        // gh-838
        if (!Boolean.TRUE.equals(map.get("active"))) {
            logger.debug("check_token returned active attribute: " + map.get("active"));
            throw new InvalidTokenException(accessToken);
        }

        return tokenConverter.extractAuthentication(map);
    }

}

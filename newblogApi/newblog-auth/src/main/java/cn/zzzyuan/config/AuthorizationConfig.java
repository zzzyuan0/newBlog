package cn.zzzyuan.config;



import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.builders.InMemoryClientDetailsServiceBuilder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.InMemoryAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-12
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationConfig extends AuthorizationServerConfigurerAdapter {

    @Value("${auth.clientId}")
    private String clientId;

    @Value("${auth.clientPassWd}")
    private String clientPassWd;

    @Autowired
    private  AuthenticationManager authenticationManager;

    @Autowired
    private  AuthorizationCodeServices authorizationCodeServices;

    @Autowired
    private  TokenStore tokenStore;

    @Autowired
    private ClientDetailsService clientDetailsService;


    /**
     * 安全策略
     * @param security
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {

        security
                // /oauth/token_key公开
                .tokenKeyAccess("permitAll()")
                // /oauth/check_token 公开
                .checkTokenAccess("permitAll()")
                // 表单认证，申请令牌
                .allowFormAuthenticationForClients();
    }

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        InMemoryClientDetailsServiceBuilder inMemoryClientDetailsServiceBuilder = clients.inMemory();

        if(StringUtils.isNotEmpty(clientId)){
                inMemoryClientDetailsServiceBuilder.withClient(clientId)
                        .secret(new BCryptPasswordEncoder().encode(clientPassWd))
                        // 可以访问的资源id
                        .resourceIds("newblog-blog","newblog-forum","newblog-user")
                        // 认证模式
                        .authorizedGrantTypes("authorization_code","password","refresh_token")
                        // 授权范围 ，权限rw
                        .scopes("all")
                        .autoApprove(false)
                        .redirectUris("http://www.baidu.com");
        }

    }

    /**
     * 令牌端点
     * @param endpoints
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        endpoints
                // 密码模式必须配置
                .authenticationManager(authenticationManager)
                // 授权码模式必须配置
                .authorizationCodeServices(authorizationCodeServices)
                // 令牌管理服务
                .tokenServices(tokenServices())
                .allowedTokenEndpointRequestMethods(HttpMethod.POST);
    }

    /**
     * 配置令牌
     *
     * @return
     */
    @Bean
    public AuthorizationServerTokenServices tokenServices(){
        DefaultTokenServices services = new DefaultTokenServices();
        services.setClientDetailsService(clientDetailsService);
        // 刷新令牌默认有效期
        services.setRefreshTokenValiditySeconds(60*60*24*3);
        // 令牌默认有效期
        services.setAccessTokenValiditySeconds(60*60*12);
        // 是否刷新令牌
        services.setSupportRefreshToken(true);
        services.setTokenStore(tokenStore);
        return services;
    }

    @Bean
    public AuthorizationCodeServices authorizationCodeServices() { //设置授权码模式的授权码如何 存取，这里采用内存方式
        return new InMemoryAuthorizationCodeServices();
    }


}

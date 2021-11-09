package cn.zzzyuan.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-14
 */
@Configuration
@EnableResourceServer
@Slf4j
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {

    @Value("${oauth.check_url}")
    private  String checkUrl;

    @Value("${oauth.client_id}")
    private  String clientId;

    @Value("${oauth.client_secret}")
    private  String clientSecret;

    @Value("${oauth.scope}")
    private  String scope;

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources
                .resourceId("newblog-user")
//                .tokenServices(tokenService())
                .stateless(true);
    }



    @Override
    public void configure(HttpSecurity http) throws Exception {
         http
                 .authorizeRequests()
                 .antMatchers("/**").access("#oauth2.hasScope('all')")
                 .anyRequest().authenticated()
//                 // 关闭 csrf
                 .and()
                 .csrf().disable()
                 // 关闭session
                 .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }

    @Primary
    @Bean
    public ResourceServerTokenServices tokenService() {
        log.info("=======token验证======");
        // 使用远程校验token
        RemoteTokenServices remoteTokenServices = new RemoteTokenServices();
        remoteTokenServices.setCheckTokenEndpointUrl(checkUrl);
        remoteTokenServices.setClientId(clientId);
        remoteTokenServices.setClientSecret(clientSecret);
        return remoteTokenServices;
    }
}

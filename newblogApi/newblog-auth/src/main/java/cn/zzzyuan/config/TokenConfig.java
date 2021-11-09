package cn.zzzyuan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-13
 */
@Configuration
public class TokenConfig {

    // 令牌存储策略
    @Bean
    public TokenStore tokenStore(){
        // 内存存储，生成平台令牌
        return new InMemoryTokenStore();
    }
}

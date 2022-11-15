package cn.zzzyuan.user.config;

import org.hashids.Hashids;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-10
 */
@Configuration
public class HashIdsConfig {

    @Bean
    public Hashids hashids() {
        return new Hashids();
    }

}

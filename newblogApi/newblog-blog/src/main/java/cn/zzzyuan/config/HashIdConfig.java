package cn.zzzyuan.config;

import org.hashids.Hashids;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-10
 */
@Configuration
public class HashIdConfig {

    @Bean
    public Hashids hashids() {
        return new Hashids();
    }

}

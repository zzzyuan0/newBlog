package cn.zzzyuan.user.config;

import org.hashids.Hashids;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 注入hashids进行使用
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

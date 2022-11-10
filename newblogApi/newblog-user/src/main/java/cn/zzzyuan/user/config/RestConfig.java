package cn.zzzyuan.user.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-13
 */
@Configuration
public class RestConfig {


    @Bean
//    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

}

package cn.zzzyuan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-10
 */
@Configuration
public class CorsConfig {

    @Bean
    public CorsWebFilter corsWebFilter(){
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfig = new CorsConfiguration();
        // 允许跨域的请求来源
        corsConfig.addAllowedOrigin("*");
        // 允许跨域的请求头
        corsConfig.addAllowedHeader("*");
        // 允许跨域的请求方法
        corsConfig.addAllowedMethod("*");
        // 允许携带cookie跨域
        corsConfig.setAllowCredentials(true);
        // 配置所有url的跨域配置
        source.registerCorsConfiguration("/**", corsConfig);
        return new CorsWebFilter(source);
    }
}

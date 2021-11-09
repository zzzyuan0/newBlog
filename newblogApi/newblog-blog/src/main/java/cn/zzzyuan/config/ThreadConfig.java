package cn.zzzyuan.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-08
 */
@Configuration
public class ThreadConfig {

    @Value("${blog.thread.coreSize}")
    private Integer coreSize;

    @Value("${blog.thread.maxSize}")
    private Integer maxSize;

    @Value("${blog.thread.keepAliveTime}")
    private Integer keepAliveTime;

    @Bean
    public ThreadPoolExecutor threadPoolExecutor(){
        return new ThreadPoolExecutor(
                coreSize,
                maxSize,
                keepAliveTime,
                TimeUnit.SECONDS,new LinkedBlockingQueue<>(10000),
                Executors.defaultThreadFactory(),
                new ThreadPoolExecutor.AbortPolicy());
    }

}

package cn.zzzyuan.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("cn.zzzyuan.user.mapper")
@EnableFeignClients
public class NewblogUserApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogUserApplication.class, args);
    }

}

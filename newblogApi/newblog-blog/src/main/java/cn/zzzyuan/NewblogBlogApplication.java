package cn.zzzyuan;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@MapperScan("cn.zzzyuan.mapper")
@EnableFeignClients
public class NewblogBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogBlogApplication.class, args);
    }

}

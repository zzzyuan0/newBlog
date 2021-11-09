package cn.zzzyuan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@EnableFeignClients(basePackages = "cn.zzzyuan.feign")
public class NewblogAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogAuthApplication.class, args);
    }

}

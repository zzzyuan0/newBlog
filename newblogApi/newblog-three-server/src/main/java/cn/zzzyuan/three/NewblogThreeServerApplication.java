package cn.zzzyuan.three;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
@MapperScan("cn.zzzyuan.three.mapper")
public class NewblogThreeServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogThreeServerApplication.class, args);
    }

}

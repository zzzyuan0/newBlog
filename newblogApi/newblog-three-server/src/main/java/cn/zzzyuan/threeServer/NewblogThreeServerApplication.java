package cn.zzzyuan.threeServer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class NewblogThreeServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogThreeServerApplication.class, args);
    }

}

package cn.zzzyuan;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cn.zzzyuan.mapper")
public class NewblogForumApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewblogForumApplication.class, args);
    }

}

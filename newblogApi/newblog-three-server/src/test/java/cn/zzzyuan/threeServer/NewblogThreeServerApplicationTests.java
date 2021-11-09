package cn.zzzyuan.threeServer;

import cn.zzzyuan.threeServer.service.smsService.SmsService;
import cn.zzzyuan.threeServer.util.RandomCaptcha;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class NewblogThreeServerApplicationTests {

    @Autowired
    private SmsService smsService;

    @Test
    void contextLoads() {
        String captcha = RandomCaptcha.createCaptcha();
        log.info("=========={}=========",captcha);
        smsService.sendVertifyCode("1537069101@qq.com", "短信验证码", "验证码为" + captcha);
    }

}

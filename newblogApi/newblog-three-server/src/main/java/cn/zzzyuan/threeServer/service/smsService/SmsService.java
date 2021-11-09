package cn.zzzyuan.threeServer.service.smsService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-01-29
 */
@Service
@Slf4j
public class SmsService {

        @Value("${spring.mail.username}")
        private String from;

        @Autowired
        private JavaMailSender mailSender;


        public void sendVertifyCode(String to, String title, String content){
            SimpleMailMessage message = new SimpleMailMessage();
            //发送人
            message.setFrom(from);
            //发送人
            message.setTo(to);
            //邮件名
            message.setSubject(title);
            //邮件名
            message.setText(content);
            mailSender.send(message);
            log.info("已经发送");
        }
}

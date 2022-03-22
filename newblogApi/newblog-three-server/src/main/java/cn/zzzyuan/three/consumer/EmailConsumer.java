package cn.zzzyuan.three.consumer;

import cn.hutool.core.date.DateUnit;
import cn.zzzyuan.common.content.CaptchaContent;
import cn.zzzyuan.common.content.ResponseContent;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.three.service.smsService.SmsService;
import cn.zzzyuan.three.util.RandomCaptcha;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotBlank;
import java.util.concurrent.TimeUnit;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-27
 */
//@Slf4j
//@Service
//@RabbitListener(queues = {"${mq.config.queue.routing-key.email}"})
public class EmailConsumer {

//    private final SmsService smsService;
//
//    private final StringRedisTemplate redisTemplate;
//
//    public EmailConsumer(SmsService smsService, StringRedisTemplate redisTemplate) {
//        this.smsService = smsService;
//        this.redisTemplate = redisTemplate;
//    }
//
//    @RabbitHandler
//    public void sendCaptcha(@Payload @NotBlank String receiveEmail){
//
//        String oldCaptcha = redisTemplate.opsForValue().get(CaptchaContent.CAPTCHA_CACHE_PREFIX + receiveEmail);
//        if(StringUtils.isNotEmpty(oldCaptcha)){
//            String s = oldCaptcha.substring(oldCaptcha.indexOf("_") + 1);
//            if(StringUtils.isNotEmpty(s)){
//                long l = Long.parseLong(s);
//                if(System.currentTimeMillis() - l < DateUnit.MINUTE.getMillis()){
//                    //todo 抛异常处理
//                    log.info("===========验证码发送太过频繁============");
//                }
//            }
//        }
//        String captcha = RandomCaptcha.createCaptcha();
//        smsService.sendVertifyCode(receiveEmail, CaptchaContent.CAPTCHA_TITLE,CaptchaContent.CAPTCHA_CONTENT.replace("{1}", captcha));
//        redisTemplate.opsForValue().set(CaptchaContent.CAPTCHA_CACHE_PREFIX +  receiveEmail, captcha + "_" + System.currentTimeMillis(),CaptchaContent.CAPTCHA_TIME, TimeUnit.MINUTES);
//    }

}

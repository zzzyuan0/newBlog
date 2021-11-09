package cn.zzzyuan.threeServer.controller;

import cn.hutool.core.date.DateUnit;
import cn.zzzyuan.common.content.CaptchaContent;
import cn.zzzyuan.common.content.ResponseContent;
import cn.zzzyuan.entity.ResponseResult;
import cn.zzzyuan.threeServer.service.smsService.SmsService;
import cn.zzzyuan.threeServer.util.RandomCaptcha;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sun.security.krb5.internal.ccache.CCacheInputStream;

import javax.validation.constraints.NotBlank;
import java.util.concurrent.TimeUnit;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-01-30
 */
@RestController
@RequestMapping("/sms")
public class SmsController {

    private final SmsService smsService;

    private final StringRedisTemplate  redisTemplate;

    public SmsController(SmsService smsService, StringRedisTemplate redisTemplate) {
        this.smsService = smsService;
        this.redisTemplate = redisTemplate;
    }

    @PostMapping("/captcha")
    public ResponseResult sendCaptcha(@RequestParam @NotBlank  String receiveEmail){

        String oldCaptcha = redisTemplate.opsForValue().get(CaptchaContent.CAPTCHA_CACHE_PREFIX + receiveEmail);
        if(StringUtils.isNotEmpty(oldCaptcha)){
            String s = oldCaptcha.substring(oldCaptcha.indexOf("_") + 1);
            if(StringUtils.isNotEmpty(s)){
                long l = Long.parseLong(s);
                if(System.currentTimeMillis() - l < DateUnit.MINUTE.getMillis()){
                    return ResponseResult.error(ResponseContent.CAPTCHA_ERROR.msg(),ResponseContent.CAPTCHA_ERROR.code(),null);
                }
            }
        }
        String captcha = RandomCaptcha.createCaptcha();
        smsService.sendVertifyCode(receiveEmail, CaptchaContent.CAPTCHA_TITLE,CaptchaContent.CAPTCHA_CONTENT.replace("{1}", captcha));
        redisTemplate.opsForValue().set(CaptchaContent.CAPTCHA_CACHE_PREFIX +  receiveEmail, captcha + "_" + System.currentTimeMillis(),CaptchaContent.CAPTCHA_TIME, TimeUnit.MINUTES);
        return ResponseResult.success(ResponseContent.CAPTCHA_SUCCESS.msg(),ResponseContent.CAPTCHA_SUCCESS.code(),null);
    }



}

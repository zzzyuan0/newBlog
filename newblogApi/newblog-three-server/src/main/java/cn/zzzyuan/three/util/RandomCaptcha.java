package cn.zzzyuan.three.util;

import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.RandomUtil;
import cn.zzzyuan.common.content.CaptchaContent;
import lombok.extern.slf4j.Slf4j;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-01-30
 */
@Slf4j
public  class RandomCaptcha {

    public static String createCaptcha() {
        int size = CaptchaContent.CAPTCHA_SIZE;
        int strSize = size - (int)(size*CaptchaContent.CAPTCHA_NUM_SIZE);
        size = size - strSize;
        StrBuilder strBuilder = new StrBuilder(CaptchaContent.CAPTCHA_SIZE);
        for (int i = 0; i < CaptchaContent.CAPTCHA_SIZE; i++) {
            double random = Math.random();
            if(random > CaptchaContent.CAPTCHA_NUM_SIZE && size >=0 ){
                    strBuilder.append(RandomUtil.randomChar(CaptchaContent.CAPTCHA_NUM));
                    size--;
            } else {
                    strBuilder.append(RandomUtil.randomChar(CaptchaContent.CAPTCHA_STRING));
            }
        }
       return strBuilder.toString();
    }


}

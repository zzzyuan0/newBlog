package cn.zzzyuan.common.content;

import javax.xml.crypto.Data;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-01-30
 */
public class CaptchaContent {


    /**
     * 验证码长度
     */
    public static final Integer CAPTCHA_SIZE = 5;

    /**
     * 验证码数字长度占比
     */
    public static final Double CAPTCHA_NUM_SIZE = 0.5;

    /**
     * 验证码字符串
     */
    public static final String CAPTCHA_STRING = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" ;

    /**
     * 验证码數字
     */
    public static final String CAPTCHA_NUM = "0123456789" ;

    /**
     * 验证码邮件标题
     */
    public static final String CAPTCHA_TITLE = "欢迎注册账号";

    /**
     * 验证码内容模板
     */
    public static final String CAPTCHA_CONTENT = "验证码：{1}（有效期10分钟），切勿转发。该邮箱用户正在申请账号，如非本人操作，请忽略本短信。";

    /**
     * 验证码缓存前缀
     */
    public static final String CAPTCHA_CACHE_PREFIX = "sms:code:";


    /**
     * 验证码有效时间
     */
    public static final Integer CAPTCHA_TIME= 10;
}

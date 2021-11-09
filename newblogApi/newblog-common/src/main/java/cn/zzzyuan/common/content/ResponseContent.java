package cn.zzzyuan.common.content;

import lombok.Data;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-11
 */
public enum  ResponseContent {
    // 结果返回成功
    SUCCESS(200,"成功"),
    // 结果返回失败
    ERROR(450,"失败"),
    // 验证码获取成功过
    CAPTCHA_SUCCESS(201,"获取验证码成功"),
    // 验证码获取成功过
    CAPTCHA_ERROR(451,"获取验证码过于频繁，请稍后再获取验证码"),

    MISS_PARAMETER(452,"缺少参数，请按要求传参"),

    ILLEGAL_ARGUMENT(453,"参数不合要求，请按要求传参");
    // 返回码
    private int code;
    // 返回信息
    private String msg;



    ResponseContent(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int code(){
        return this.code;
    }
    public String msg(){
        return this.msg;
    }
}

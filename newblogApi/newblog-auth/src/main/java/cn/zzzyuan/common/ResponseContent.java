package cn.zzzyuan.common;

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
    // 缺少token
    MISSING_TOKEN(401, "缺少token"),
    // token失效
    TOKEN_EXPIRED(441, "Token 失效");


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

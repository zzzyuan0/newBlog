package cn.zzzyuan.common.entity;

import cn.zzzyuan.common.content.ResponseContent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseResult implements Serializable {

    private String msg;

    private int code;

    private Object data;

    public static ResponseResult success(String msg,int code,Object data){
        return new ResponseResult(msg,code,data);
    }

    public static ResponseResult success(Object data){
        return new ResponseResult(ResponseContent.SUCCESS.msg(),ResponseContent.SUCCESS.code(),data);
    }

    public static ResponseResult success(String msg,Object data){
        return new ResponseResult(msg,ResponseContent.SUCCESS.code(),data);
    }

    public static ResponseResult success(){
        return new ResponseResult(ResponseContent.SUCCESS.msg(),ResponseContent.SUCCESS.code(),null);
    }


    public static ResponseResult error(String msg,int code,Object data){
        return new ResponseResult(msg,code,data);
    }
    public static ResponseResult error(Object data){
        return new ResponseResult(ResponseContent.ERROR.msg(),ResponseContent.ERROR.code(),data);
    }

    public static ResponseResult error(String msg,Object data){
        return new ResponseResult(msg,ResponseContent.ERROR.code(),data);
    }
}

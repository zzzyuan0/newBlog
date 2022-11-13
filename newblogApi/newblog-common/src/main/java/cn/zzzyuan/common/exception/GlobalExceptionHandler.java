package cn.zzzyuan.common.exception;

import cn.zzzyuan.common.content.ResponseContent;
import cn.zzzyuan.common.entity.ResponseResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-11
 */
@Slf4j
public class GlobalExceptionHandler{

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseResult illegalArgumentException(IllegalArgumentException e){
        log.error("{}--{}，异常类型--{}",ResponseContent.ILLEGAL_ARGUMENT.msg(), e.getMessage(),e.getClass());
        return ResponseResult.error(ResponseContent.ILLEGAL_ARGUMENT.msg(),ResponseContent.ILLEGAL_ARGUMENT.code(),null);
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseResult missingServletRequestParameterException(MissingServletRequestParameterException e){
        log.error("{}--{}，异常类型--{}",ResponseContent.MISS_PARAMETER.msg(), e.getMessage(),e.getClass());
        return ResponseResult.error(ResponseContent.MISS_PARAMETER.msg(),ResponseContent.MISS_PARAMETER.code(),null);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseResult allException(Exception e){
        log.error("{}--{}，异常类型--{}",ResponseContent.ERROR.msg(), e.getMessage(),e.getClass());
        return ResponseResult.error(ResponseContent.ERROR.msg(),ResponseContent.ERROR.code(),null);
    }

}

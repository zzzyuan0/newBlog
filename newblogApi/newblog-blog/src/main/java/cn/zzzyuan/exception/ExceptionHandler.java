package cn.zzzyuan.exception;

import cn.zzzyuan.common.content.ResponseContent;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.common.exception.GlobalExceptionHandler;
import io.lettuce.core.RedisCommandTimeoutException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-07
 */
@RestControllerAdvice
@Slf4j
public class ExceptionHandler extends GlobalExceptionHandler {

    @org.springframework.web.bind.annotation.ExceptionHandler(RedisCommandTimeoutException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseResult missingServletRequestParameterException(RedisCommandTimeoutException e){
        log.error("{}--{}，异常类型--{}",ResponseContent.ERROR.msg(), e.getMessage(),e.getClass());
        return ResponseResult.error(ResponseContent.ERROR.msg(), ResponseContent.ERROR.code(),null);
    }

}

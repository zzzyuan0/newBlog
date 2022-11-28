package cn.zzzyuan.exception;

import cn.zzzyuan.common.content.ResponseContent;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.common.exception.GlobalExceptionHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.common.exceptions.InvalidGrantException;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-07
 */
@RestControllerAdvice
@Slf4j
public class ExceptionHandler extends GlobalExceptionHandler {

    @org.springframework.web.bind.annotation.ExceptionHandler(InvalidGrantException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseResult invalidGrantException(IllegalArgumentException e){
        log.error(getExceptionDetail(e));
        return ResponseResult.error(ResponseContent.ERROR_INFO.msg(),ResponseContent.ERROR_INFO.code(), e.getMessage());
    }

    @org.springframework.web.bind.annotation.ExceptionHandler(InvalidTokenException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseResult invalidGrantException(InvalidTokenException e){
        log.error(getExceptionDetail(e));
        return ResponseResult.error(ResponseContent.TOKEN_EXPIRED.msg(),ResponseContent.TOKEN_EXPIRED.code(), e.getMessage());
    }
}

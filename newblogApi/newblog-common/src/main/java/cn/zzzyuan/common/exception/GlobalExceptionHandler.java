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
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseResult illegalArgumentException(IllegalArgumentException e){
        log.error(getExceptionDetail(e));
        return ResponseResult.error(ResponseContent.ILLEGAL_ARGUMENT.msg(),ResponseContent.ILLEGAL_ARGUMENT.code(), e.getMessage());
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseResult missingServletRequestParameterException(MissingServletRequestParameterException e){
        log.error(getExceptionDetail(e));
        return ResponseResult.error(ResponseContent.MISS_PARAMETER.msg(),ResponseContent.MISS_PARAMETER.code(), e.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseResult allException(Exception e){
        log.error(getExceptionDetail(e));
        return ResponseResult.error(ResponseContent.ERROR.msg(),ResponseContent.ERROR.code(), e.getMessage());
    }

    public  String getExceptionDetail(Exception e) {

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(e.getClass()).append(System.getProperty("line.separator"));
        stringBuilder.append(e.getLocalizedMessage()).append(System.getProperty("line.separator"));
        StackTraceElement[] arr = e.getStackTrace();
        for (StackTraceElement stackTraceElement : arr) {
            stringBuilder.append(stackTraceElement.toString()).append(System.getProperty("line.separator"));
        }
        return stringBuilder.toString();
    }


}

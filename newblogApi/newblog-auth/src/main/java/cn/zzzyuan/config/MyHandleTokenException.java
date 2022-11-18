package cn.zzzyuan.config;

import cn.zzzyuan.common.ResponseContent;
import cn.zzzyuan.common.entity.ResponseResult;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.oauth2.common.exceptions.InvalidTokenException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-17
 */
@Configuration
public class MyHandleTokenException implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        if (e instanceof AccountExpiredException) {
            ResponseResult error = ResponseResult.error(ResponseContent.TOKEN_EXPIRED.msg(), ResponseContent.TOKEN_EXPIRED.code(), e.getMessage());
            httpServletResponse.setContentType("application/json");
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(httpServletResponse.getOutputStream(), error);
        }
    }
}

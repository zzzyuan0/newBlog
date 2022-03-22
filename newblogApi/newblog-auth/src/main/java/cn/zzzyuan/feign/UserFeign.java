package cn.zzzyuan.feign;

import cn.zzzyuan.common.entity.ResponseResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.constraints.NotNull;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-13
 */
@FeignClient("newblog-user")
@RequestMapping("/user")
@Component
public interface UserFeign {

    /**
     * 通过用户名去数据库查询用户加密后密码
     * @param username
     * @return
     */
    @GetMapping("/info/getUser/{username}")
    public ResponseResult getPasswordByUsername(@NotNull @PathVariable("username") String username);

}

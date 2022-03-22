package cn.zzzyuan.config;

import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.feign.UserFeign;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户验证以及权限设置
 * @author codesuperman@foxmail.com
 * @date 2021-11-13
 */
@Component
@Slf4j
public class UserDetailsConfig implements UserDetailsService {

    @Autowired
    UserFeign userFeign;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("=========用户-{}-正在验证身份=========",username);
        ResponseResult responseResult = userFeign.getPasswordByUsername(username);

        if(responseResult.getData() == null){
            throw new UsernameNotFoundException("此用户不存在");
        }
        String passWd = String.valueOf(responseResult.getData());
        SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority("ROLE_admin");
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(simpleGrantedAuthority);
        return new User(username, passWd, authorities);
    }
}

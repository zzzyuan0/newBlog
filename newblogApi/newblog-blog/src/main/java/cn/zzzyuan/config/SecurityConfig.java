package cn.zzzyuan.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import java.util.Arrays;
import java.util.List;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-15
 */
@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("#{'${allowUrl}'.split(',')}")
    private List<String> allowUrl;

    @Override
    public void configure(WebSecurity web) throws Exception {

        web.ignoring().antMatchers(allowUrl.toArray(new String[0]));
    }
}

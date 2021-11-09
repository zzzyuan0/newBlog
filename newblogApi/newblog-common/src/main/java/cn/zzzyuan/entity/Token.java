package cn.zzzyuan.entity;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.map.MapUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-03
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class Token {

    private String accessToken;

    private String tokenType;

    private String refreshToken;

    private int expiresIn;

    private String scope;


}

package cn.zzzyuan.user.service;

import cn.zzzyuan.common.entity.Token;

/**
 * @author codesuperman@foxmail.com
 * @date 2021-11-14
 */
public interface TokenService {

    /**
     * 获取token
     * @return
     */
    public Token getToken(String username, String password) throws Exception;

}

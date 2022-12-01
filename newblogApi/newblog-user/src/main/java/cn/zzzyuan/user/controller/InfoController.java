package cn.zzzyuan.user.controller;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.common.annotation.OperateLog;
import cn.zzzyuan.common.content.CaptchaContent;
import cn.zzzyuan.common.content.LogOperateTypeContent;
import cn.zzzyuan.user.entity.Info;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.common.entity.Token;
import cn.zzzyuan.user.entity.dto.RegisterDTO;
import cn.zzzyuan.user.service.ExtService;
import cn.zzzyuan.user.service.InfoService;
import cn.zzzyuan.user.service.TokenService;
import cn.zzzyuan.user.entity.dto.LoginDTO;
import cn.zzzyuan.user.entity.dto.UserDTO;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.HashMap;

/**
 * <p>
 * 用户信息表 前端控制器
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */

//@RefreshScope
@RestController
@RequestMapping("/info")
@Slf4j
// 生成包含final和@NonNull注解的成员变量的构造器
@RequiredArgsConstructor
public class InfoController {

    private final InfoService infoService;

    private final ExtService extService;

    private final TokenService tokenService;

    private final StringRedisTemplate stringRedisTemplate;

    @GetMapping("/getUser/{username}")
    @OperateLog(module = "${spring.application.name}", type = LogOperateTypeContent.LOG_TYPE_GET, desc = "获取用户加密密码进行验证",paramDesc = "用户名",paramType = "String")
    public ResponseResult getPasswordByUsername(@NotNull @PathVariable("username") String username) {
        log.info("========获取用户{}信息======",username);
        Info info = infoService.getOne(new QueryWrapper<Info>().select("password").eq("email", username));
        if(ObjectUtils.isNotEmpty(info)){
            return ResponseResult.success(info.getPassword());
        }

        return ResponseResult.error(null);
    }

    @GetMapping("/getUserById")
    @OperateLog(module = "${spring.application.name}", type = LogOperateTypeContent.LOG_TYPE_GET,
            desc = "获取用户信息",paramDesc = "用户id",paramType = "String")
    public ResponseResult getUserInfoById(@NotNull @RequestParam("id")Integer id) {
        log.info("========获取用户{}信息======",id);
        Info info = infoService.getOne(new QueryWrapper<Info>()
                .eq("id", id));
        if(ObjectUtils.isNotEmpty(info)){
            return ResponseResult.success(info);
        }
        return ResponseResult.error(null);
    }

    @PostMapping("/login")
    public ResponseResult login(@Validated @RequestBody LoginDTO loginDTO) throws Exception {
        log.info("===========登录获取令牌=========");
        Token token = tokenService.getToken(loginDTO.getEmail(), loginDTO.getPassword());
        Info info = null;
        if(ObjectUtils.isNotEmpty(token)){
            info = infoService.getOne(new QueryWrapper<Info>()
                    .select(Info.class,userInfo -> !"password".equals(userInfo.getColumn()))
                    .eq("email", loginDTO.getEmail()));
        }
        return ResponseResult.success(MapUtil.builder(new HashMap<String,Object>(2))
                .put("token", token).put("userInfo", info).build());
    }

    @PostMapping("/register")
    public ResponseResult registrar(@Validated @RequestBody RegisterDTO registerDTO){
        log.info("===========正在进行注册=========");
       if(!registerDTO.getPassword().equals( registerDTO.getRePassword() )){
           return ResponseResult.error("两次输入密码不一致",null);
       }
        String captchas = stringRedisTemplate.opsForValue().get(CaptchaContent.CAPTCHA_CACHE_PREFIX + registerDTO.getEmail());
        if (StringUtils.isNotEmpty(captchas)){
            String captcha = captchas.split("_")[0];
            if(captcha.toLowerCase().equals(registerDTO.getCode().toLowerCase())){
                if(infoService.getOne(
                        new QueryWrapper<Info>().eq("email", registerDTO.getEmail())) != null){
                    return ResponseResult.error("此邮箱已经被注册",null);
                }
                Info info = new Info();
                BeanUtil.copyProperties(registerDTO,info,true);
                BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
                info.setPassword(bc.encode(info.getPassword()));
                boolean save = infoService.save(info);
                if (save){
                    return ResponseResult.success("注册成功", null);
                } else {
                    return ResponseResult.error("注册失败",null);
                }
            }
        }
        return ResponseResult.error("验证码错误",null);
    }

    @PostMapping("/update")
    public ResponseResult update(@Validated @RequestBody UserDTO userDTO){
//        Info info = new Info();
//        BeanUtil.copyProperties(userDTO,info,true);
//        info.setPassword(new BCryptPasswordEncoder().encode(userDTO.getPassword()));
//        boolean save = infoService.save(info);
//        if(save){
//            Ext ext = new Ext();
//            BeanUtil.copyProperties(userDTO, ext, true);
//            ext.setUserId(info.getId());
//            boolean save1 = extService.save(ext);
//            if (save1){
//                return new ResponseResult();
//            }
//        }
        log.info(userDTO.toString());
        return new ResponseResult();
    }

}

package cn.zzzyuan.feign;

import cn.zzzyuan.common.annotation.OperateLog;
import cn.zzzyuan.common.content.LogOperateTypeContent;
import cn.zzzyuan.common.entity.ResponseResult;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-06
 */
@FeignClient(name = "newblog-user")
@Component
@RequestMapping("/user")
public interface UserFeign {


    /**
     *  获取评论热度排行
     * @param num 排名前几的
     * @return
     */
    @GetMapping("/comment/newCommentList")
    @Cacheable(cacheNames = "commentHeatListCache",key = "'commentHeatList' + #num")
    ResponseResult getCommentHeatList(@RequestParam(name = "num") Integer num);

    @GetMapping("/info/getUserById")
    @Cacheable(cacheNames = "userInfoCache", key = "'userInfogCache' + #id")
    public ResponseResult getUserInfoById(@NotNull @RequestParam(name = "id")Integer id);

}

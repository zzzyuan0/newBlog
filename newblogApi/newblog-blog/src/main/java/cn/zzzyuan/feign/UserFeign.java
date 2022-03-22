package cn.zzzyuan.feign;

import cn.zzzyuan.common.entity.ResponseResult;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @GetMapping("/comment/heat-list")
    @Cacheable(cacheNames = "commentHeatList")
    ResponseResult getCommentHeatList(@RequestParam(name = "num") Integer num);

}

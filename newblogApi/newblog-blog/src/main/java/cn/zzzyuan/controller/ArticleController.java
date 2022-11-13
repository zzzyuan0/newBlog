package cn.zzzyuan.controller;


import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.dto.ArticleDTO;
import cn.zzzyuan.feign.UserFeign;
import cn.zzzyuan.service.ArticleService;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import lombok.extern.slf4j.Slf4j;
import org.hashids.Hashids;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 用户文章表 前端控制器
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
@RestController
@RequestMapping("/article")
@Slf4j
public class ArticleController {

    private final ArticleService articleService;

    private final UserFeign userFeign;

    private final Hashids hashids;

    private final StringRedisTemplate stringRedisTemplate;

    @Value("${cache.key.ArticleHeatCacheKey}")
    private String articleHeatCacheKey;


    public ArticleController(ArticleService articleService, UserFeign userFeign, Hashids hashids, StringRedisTemplate stringRedisTemplate) {
        this.articleService = articleService;
        this.userFeign = userFeign;
        this.hashids = hashids;
        this.stringRedisTemplate = stringRedisTemplate;
    }

    @GetMapping("/get")
    public ResponseResult getArticleById(@RequestParam("id") String id) {
        // 解析加密后的id
        long[] decode = hashids.decode(id);
        ArticleDTO article = null;
        Map<String, Object> result = null;
        // id 不为空则获取对应文章作者分类信息
        if(decode.length != 0) {
            article = articleService.getArticleAndCategoryById((int) decode[0]);
            Integer userId = article.getUserId();
            ResponseResult userInfoById = userFeign.getUserInfoById(userId);
            result = MapUtil.builder(new HashMap<String, Object>(2))
                    .put("article", article)
                    .put("userInfo", userInfoById.getData())
                    .build();

            // 增加文章热度，先修改redis，再修改mysql
            stringRedisTemplate.opsForZSet().incrementScore(articleHeatCacheKey,
                    hashids.encode(Long.parseLong(article.getId())) + "$" + article.getTitle(), 1);
            articleService.update(new UpdateWrapper<Article>().set("heat",article.getHeat() + 1));
        }

        return ResponseResult.success(result);
    }

}

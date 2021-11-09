package cn.zzzyuan.controller;


import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.Category;
import cn.zzzyuan.entity.ImgUrl;
import cn.zzzyuan.entity.ResponseResult;
import cn.zzzyuan.feign.UserFeign;
import cn.zzzyuan.service.ArticleService;
import cn.zzzyuan.service.CategoryService;
import cn.zzzyuan.service.ImgUrlService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * <p>
 * 分类文章联系表 前端控制器
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
@RestController
@RequestMapping("/index")
public class IndexController {

    private final ImgUrlService imgUrlService;

    private final CategoryService categoryService;

    private final ArticleService articleService;

    private final UserFeign userFeign;

    private final ThreadPoolExecutor threadPoolExecutor;



    public IndexController(ImgUrlService imgUrlService, CategoryService categoryService, ArticleService articleService,
                           UserFeign userFeign, ThreadPoolExecutor threadPoolExecutor) {
        this.imgUrlService = imgUrlService;
        this.categoryService = categoryService;
        this.articleService = articleService;
        this.userFeign = userFeign;
        this.threadPoolExecutor = threadPoolExecutor;
    }

    @GetMapping("/")
    public ResponseResult getIndex() throws ExecutionException, InterruptedException {

        HashMap<String, Object> stringObjectHashMap = new HashMap<>(5);

//        获取首页图片
        CompletableFuture<Void> randomImg = CompletableFuture.runAsync(() -> {
            stringObjectHashMap.put("imgList", imgUrlService.getRandomImg(5));
        }, threadPoolExecutor);

//        获取文章热度排行
        CompletableFuture<Void> articleHeatList = CompletableFuture.runAsync(() -> {
             stringObjectHashMap.put("articleHeatList", articleService.list(new QueryWrapper<Article>().orderByAsc("heat")
                    .select("title", "heat").last("limit 0,10")));
        }, threadPoolExecutor);


//        最新获取文章
        CompletableFuture<Void> articleList = CompletableFuture.runAsync(() -> {
              stringObjectHashMap.put("articleList", articleService.getNewArticle(10) );
        }, threadPoolExecutor);

//        获取评论
        CompletableFuture<Void> commentHeatList = CompletableFuture.runAsync(() -> {
             stringObjectHashMap.put("commentHeatList", userFeign.getCommentHeatList(10) );
        }, threadPoolExecutor);

//        获取标签云
        CompletableFuture<Void> categoryList = CompletableFuture.runAsync(() -> {
             stringObjectHashMap.put("categoryList", categoryService.getAllCategory() );
        }, threadPoolExecutor);

        CompletableFuture.allOf(randomImg,articleHeatList,articleList,commentHeatList,categoryList).get();

        return ResponseResult.success(stringObjectHashMap);

    }

}

package cn.zzzyuan.controller;


import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.entity.Article;
import cn.zzzyuan.service.ArticleService;
import org.hashids.Hashids;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
public class ArticleController {

    private final ArticleService articleService;

    private final Hashids hashids;

    public ArticleController(ArticleService articleService, Hashids hashids) {
        this.articleService = articleService;
        this.hashids = hashids;
    }

    @GetMapping("/get/{id}")
    public ResponseResult getArticleById(@PathVariable("id") String id) {
        long[] decode = hashids.decode(id);
        Article article = null;
        if(decode.length != 0) {
            article = articleService.getById(decode);
        }
        return ResponseResult.success(article);
    }

}

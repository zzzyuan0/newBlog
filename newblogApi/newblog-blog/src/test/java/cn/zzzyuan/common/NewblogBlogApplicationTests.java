package cn.zzzyuan.common;

import cn.zzzyuan.entity.dto.ArticleDTO;
import cn.zzzyuan.service.ArticleService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class NewblogBlogApplicationTests  {

    @Autowired
    private ArticleService articleService;

    @Test
    void contextLoads() {
        ArticleDTO articleAndCategory = articleService.getArticleAndCategoryById(1);
    }


}

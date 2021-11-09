package cn.zzzyuan.service;

import cn.zzzyuan.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 用户文章表 服务类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
public interface ArticleService extends IService<Article> {

    List<Article> getArticleHeat(Integer num);

    List<Article> getNewArticle(Integer num);

}

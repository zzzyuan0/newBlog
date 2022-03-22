package cn.zzzyuan.service;

import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.Category;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
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

    IPage<Article> getArticleByTagPage(IPage<Article> page, QueryWrapper<Category> wrapper);

}

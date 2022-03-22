package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.Category;
import cn.zzzyuan.mapper.ArticleMapper;
import cn.zzzyuan.service.ArticleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户文章表 服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
@Service
@Slf4j
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Override
    public List<Article> getArticleHeat(Integer num) {

        return  this.list(new QueryWrapper<>());
    }

    @Override
    @Cacheable(value = "newArticle")
    public IPage<Article> getArticleByTagPage(IPage<Article> page, QueryWrapper<Category> wrapper) {
        log.info("获取newArticle===================");
        return baseMapper.getBlogByTagIPage(page,wrapper);
    }

}

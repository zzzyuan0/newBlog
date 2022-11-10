package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.Category;
import cn.zzzyuan.entity.dto.ArticleDTO;
import cn.zzzyuan.mapper.ArticleMapper;
import cn.zzzyuan.service.ArticleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.hashids.Hashids;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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

    @Value("${cache.key.ArticleHeatCacheKey}")
    public String articleHeatCacheKey;

    public final StringRedisTemplate redisTemplate;

    public final Hashids hashids;

    public ArticleServiceImpl(StringRedisTemplate redisTemplate, Hashids hashids) {
        this.redisTemplate = redisTemplate;
        this.hashids = hashids;
    }

    @Override
    public List<ArticleDTO> getArticleHeat(Integer num) {
        Boolean hasCache = redisTemplate.hasKey(articleHeatCacheKey);
        List<ArticleDTO> list = new ArrayList<>();
        if(hasCache) {
            Set<ZSetOperations.TypedTuple<String>> typedTuples =
                    redisTemplate.opsForZSet().reverseRangeByScoreWithScores("articleHeatCacheKey", 0, 10);
            if(typedTuples != null) {

                for (ZSetOperations.TypedTuple<String> typedTuple : typedTuples) {
                    String value = typedTuple.getValue();
                    if (value == null) {
                        continue;
                    }
                    String[] values = value.split("$");
                    list.add(list.size(),new ArticleDTO()
                            .setId(values[0])
                            .setTitle(values[1])
                            .setHeat(typedTuple.getScore().intValue()));
                }
                return list;
            }
        }
        // 缓存中无数据 从数据库获取并加载至redis
        List<Article> Articles = this.list(new QueryWrapper<Article>()
                .select("id", "title", "heat")
                .orderByAsc("heat")
                .last("limit 0,10"));
        for (Article article : Articles) {
            // id 加密
            String encodeId = hashids.encode(article.getId());
            list.add(new ArticleDTO()
                    .setId(encodeId)
                    .setTitle(article.getTitle())
                    .setHeat(article.getHeat()));
            //  缓存至数据库
            redisTemplate.opsForZSet().add(articleHeatCacheKey,
                    encodeId + "$" + article.getTitle(),
                    article.getHeat());
        }

        return list;
    }

    @Override
    @Cacheable(value = "newArticle")
    public IPage<ArticleDTO> getArticleByTagPage(Integer page, Integer categoryId) {
        log.info("获取newArticle===================");
        QueryWrapper<Category> wrapper = new QueryWrapper<>();
        wrapper.eq("id", categoryId);
        return null;
    }

    @Override
    @Cacheable(cacheNames = "articleCache", key = "'articleCache' + #page")
    public List<ArticleDTO> getArticleHeatByPage(Integer page) {
        Page<Article> articlePage = this.page(new Page<Article>(page, 6),
                new QueryWrapper<Article>().select("id", "title")
                        .orderByDesc("create_time"));
        List<Article> records = articlePage.getRecords();
        List<ArticleDTO> dtoArrayList = new ArrayList<>(records.size());
        for (Article record : records) {
            dtoArrayList.add(new ArticleDTO()
                    .setTitle(record.getTitle())
                    .setId(hashids.encode(record.getId())));
        }
        return dtoArrayList;
    }

}

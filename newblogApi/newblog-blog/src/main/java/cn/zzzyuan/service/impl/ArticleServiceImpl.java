package cn.zzzyuan.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.ArticleCategoryRel;
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
import java.util.HashMap;
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
    private String articleHeatCacheKey;

    private final StringRedisTemplate redisTemplate;

    private final Hashids hashids;

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
                    redisTemplate.opsForZSet().reverseRangeWithScores(articleHeatCacheKey, 0, 10);
            if(typedTuples != null) {

                for (ZSetOperations.TypedTuple<String> typedTuple : typedTuples) {
                    String value = typedTuple.getValue();
                    if (value == null) {
                        continue;
                    }
                    String[] values = value.split("\\$");
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
    @Cacheable(cacheNames = "articleCache",key = "'ArticleByPageAndCategoryCache' + #categoryId + '$' + #page")
    public HashMap<String, Object> getArticleByPageAndCategory(Integer page, Integer categoryId) {
        IPage<Article> articlePage = baseMapper.getBlogByCategoryIpage(new Page<>(page, 6),
                new QueryWrapper<ArticleCategoryRel>().eq("id", categoryId));
        return pageToDtoPage(articlePage);
    }

    @Override
    @Cacheable(cacheNames = "articleCache", key = "'articleCache' + #page")
    public HashMap<String, Object> getArticleByPage(Integer page, HashMap<String, String> params) {
        Page<Article> articlePage = this.page(new Page<Article>(page, 6),
                new QueryWrapper<Article>().select("id", "title")
                        .allEq(params)
                        .orderByDesc("create_time"));
        return pageToDtoPage(articlePage);
    }

    @Override
    @Cacheable(cacheNames = "articleInfoCache", key = "'articleInfo' + #id")
    public ArticleDTO getArticleAndCategoryById(Integer id) {
        return baseMapper.getArticleAndCategoryById(id);
    }

    private HashMap<String, Object> pageToDtoPage(IPage<Article> iPage) {
        List<Article> articles = iPage.getRecords();
        List<ArticleDTO> dtoArrayList = new ArrayList<>(articles.size());
        for (Article record : articles) {
            dtoArrayList.add(new ArticleDTO()
                    .setTitle(record.getTitle())
                    .setId(hashids.encode(record.getId())));
        }
        HashMap<String, Object> stringObjectHashMap = new HashMap<>();
        stringObjectHashMap.put("articleList", dtoArrayList);
        stringObjectHashMap.put("currentPage", iPage.getCurrent());
        stringObjectHashMap.put("total", iPage.getTotal());
        return stringObjectHashMap;
    }

}

package cn.zzzyuan.mapper;

import cn.zzzyuan.entity.Article;
import cn.zzzyuan.entity.ArticleCategoryRel;
import cn.zzzyuan.entity.Category;
import cn.zzzyuan.entity.dto.ArticleDTO;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 用户文章表 Mapper 接口
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
public interface ArticleMapper extends BaseMapper<Article> {

    /**
     * @param page 分页
     * @param wrappers
     * @return
     */
    @Select("SELECT t3.id,t3.user_id,t3.title,t3.category,t3.content,t3.created " +
            "FROM  t_category_blog t2 INNER JOIN t_blog t3 ON t3.id= t2.article_id ${ew.customSqlSegment}")
    IPage<Article> getBlogByCategoryIpage(IPage<Article> page,
                                          @Param(Constants.WRAPPER) QueryWrapper<ArticleCategoryRel> wrappers);


    ArticleDTO getArticleAndCategoryById(@Param("id") Integer id);


}

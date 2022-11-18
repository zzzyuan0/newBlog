package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Category;
import cn.zzzyuan.mapper.CategoryMapper;
import cn.zzzyuan.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotBlank;
import javax.xml.transform.Result;
import java.util.List;

/**
 * <p>
 * 文章分类表 服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
@Service
@Slf4j
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {


    @Override
    @Cacheable("categoryList")
    public List<Category> getAllCategory() {
        return list();
    }

    @Override
    @CacheEvict(value = "categoryList", allEntries = true)
    public Boolean addCategory(Integer parentId, String name) {
        return true;
    }

}

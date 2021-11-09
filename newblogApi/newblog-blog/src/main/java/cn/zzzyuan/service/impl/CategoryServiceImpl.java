package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Category;
import cn.zzzyuan.mapper.CategoryMapper;
import cn.zzzyuan.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

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
        log.info("categoryList 获取=========================================");
        return list();
    }
}

package cn.zzzyuan.service;

import cn.zzzyuan.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * <p>
 * 文章分类表 服务类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
public interface CategoryService extends IService<Category> {

    List<Category> getAllCategory();

    Boolean addCategory(Integer parentId, String name);

}

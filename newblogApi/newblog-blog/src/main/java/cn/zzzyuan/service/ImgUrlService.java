package cn.zzzyuan.service;

import cn.zzzyuan.entity.ArticleCategoryRel;
import cn.zzzyuan.entity.ImgUrl;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 分类文章联系表 服务类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
public interface ImgUrlService extends IService<ImgUrl> {

    /**
     * 随机获取图片
     * @param num
     * @return
     */
    List<ImgUrl> getRandomImg(Integer num);

}

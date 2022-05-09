package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Content;
import cn.zzzyuan.mapper.ContentMapper;
import cn.zzzyuan.service.ContentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文档内容 服务实现类
 * </p>
 *
 * @author 
 * @since 2022-04-13
 */
@Service
public class ContentServiceImpl extends ServiceImpl<ContentMapper, Content> implements ContentService {

}

package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Posts;
import cn.zzzyuan.service.PostsService;
import cn.zzzyuan.mapper.PostsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Service
public class PostsServiceImpl extends ServiceImpl<PostsMapper, Posts> implements PostsService {

}

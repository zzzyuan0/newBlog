package cn.zzzyuan.user.service.impl;

import cn.zzzyuan.user.entity.CommentUserLike;
import cn.zzzyuan.user.mapper.CommentUserLikeMapper;
import cn.zzzyuan.user.service.CommentUserLikeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 记录用户什么时候点赞了 服务实现类
 * </p>
 *
 * @author
 * @since 2022-11-17
 */
@Service
public class CommentUserLikeServiceImpl extends ServiceImpl<CommentUserLikeMapper, CommentUserLike> implements CommentUserLikeService {

}

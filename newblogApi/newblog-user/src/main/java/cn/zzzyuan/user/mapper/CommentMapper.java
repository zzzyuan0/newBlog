package cn.zzzyuan.user.mapper;

import cn.zzzyuan.user.entity.Comment;
import cn.zzzyuan.user.entity.UserIsLikeComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 评论表 Mapper 接口
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
public interface CommentMapper extends BaseMapper<Comment> {

    List<UserIsLikeComment> SelectUserIsLikeCommentInfo(Integer article, Integer userId);

}

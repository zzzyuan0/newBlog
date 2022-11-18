package cn.zzzyuan.user.service;

import cn.zzzyuan.user.entity.Comment;
import cn.zzzyuan.user.entity.CommentTree;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 评论表 服务类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
public interface CommentService extends IService<Comment> {

    /**
     * 通过文章id和用户id获取评论文章对应评论以及用户是否点赞
     * @param articleId 文章id
     * @param userId 用户 id
     * @return 返回评论树
     */
    List<CommentTree> selectByArticleAndUserIdGetComment(Integer articleId, Integer userId);


}

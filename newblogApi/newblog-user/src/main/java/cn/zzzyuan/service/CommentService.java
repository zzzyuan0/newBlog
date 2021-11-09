package cn.zzzyuan.service;

import cn.zzzyuan.entity.Comment;
import cn.zzzyuan.entity.CommentTree;
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
     * 通过文章id获取评论
     * @param id
     * @return
     */
    List<CommentTree> selectByArticleGetComment(Integer id);


}

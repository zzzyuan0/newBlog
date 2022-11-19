package cn.zzzyuan.user.service.impl;

import cn.zzzyuan.user.entity.*;
import cn.zzzyuan.user.mapper.CommentMapper;
import cn.zzzyuan.user.service.CommentService;
import cn.zzzyuan.user.service.InfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Service
@Slf4j
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {


    private final InfoService infoService;

    public CommentServiceImpl(InfoService infoService) {
        this.infoService = infoService;
    }




    @Override
    public List<CommentTree> selectByArticleAndUserIdGetComment(Integer articleId, Integer userId) {
        List<UserIsLikeComment> comments = baseMapper.SelectUserIsLikeCommentInfo(articleId, userId);
        List<CommentTree> commentTrees = new ArrayList<>();
        if(comments == null || comments.size() == 0){
            return commentTrees;
        }

        ArrayList<Integer> integers = new ArrayList<>();
        for (UserIsLikeComment comment : comments) {
            integers.add(comment.getUserId());
        }
        List<Info> list = infoService.list(new QueryWrapper<Info>().select("id", "avatar", "email", "name").in("id", integers));
        Map<Integer, Info> integerInfoHashMap = new HashMap<>(list.size());
        for (Info info : list) {
            integerInfoHashMap.put(info.getId(), info);
        }

        List<CommentTree> finalCommentTrees = commentTrees;
// 0 == null 会报空指针 ， 因为Integer的null 拆箱 intValue
        Integer a = 0;
        List<UserIsLikeComment> collect = comments.stream().filter(e -> a.equals(e.getParentId())).collect(Collectors.toList());
        for (UserIsLikeComment comment : collect) {
            finalCommentTrees.add(CommentTree.builder().comment(comment).info(integerInfoHashMap.get(comment.getUserId())).level(0).build());
        }
        commentTrees = getCommentTree(finalCommentTrees.stream().sorted().collect(Collectors.toList()), comments, integerInfoHashMap);
        return commentTrees;
    }

    /**
     * 获取评论树，获取一级评论下面的所有评论并按时间顺序排序
     * @param commentTrees 一级评论树
     * @param comments 该文章下面所有评论
     * @param integerInfoHashMap
     * @return
     */
    private List<CommentTree> getCommentTree(List<CommentTree> commentTrees, List<UserIsLikeComment> comments,Map<Integer, Info> integerInfoHashMap){

        for (CommentTree commentTree : commentTrees) {
            List<CommentTree> childCommentTrees = new ArrayList<>();
            Integer parentId = commentTree.getComment().getId();
            List<UserIsLikeComment> collect = comments.stream().filter(e -> parentId.equals(e.getParentId())).collect(Collectors.toList());

            if (collect.size() != 0) {
                List<CommentLeaf> commentLeaves = new ArrayList<>();
                collect.forEach(e -> {
                    commentLeaves.add(CommentLeaf.builder().comment(e).info(integerInfoHashMap.get(e.getUserId())).build());
                    commentLeaves.addAll(getCommentLeaf(e, comments, integerInfoHashMap));
                });
                Collections.sort(commentLeaves);
                commentTree.setCommentList(commentLeaves);
            }
        }
        return commentTrees;
    }

    private List<CommentLeaf> getCommentLeaf(UserIsLikeComment userIsLikeComments, List<UserIsLikeComment> comments,
                                                   Map<Integer, Info> integerInfoHashMap) {
        List<UserIsLikeComment> collect = comments.stream().filter(e -> userIsLikeComments.getId().equals(e.getParentId())).collect(Collectors.toList());
        List<CommentLeaf> commentLeaves = new ArrayList<>(collect.size());
        if(collect.size() != 0) {
            for (UserIsLikeComment userIsLikeComment : collect) {
                commentLeaves.add(CommentLeaf.builder().comment(userIsLikeComment).info(integerInfoHashMap.get(userIsLikeComment.getUserId())).build());
                List<CommentLeaf> commentLeaf = getCommentLeaf(userIsLikeComment, comments, integerInfoHashMap);
                commentLeaves.addAll(commentLeaf);
            }
        }
        return commentLeaves;
    }


}

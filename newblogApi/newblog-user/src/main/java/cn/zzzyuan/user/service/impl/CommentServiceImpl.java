package cn.zzzyuan.user.service.impl;

import cn.zzzyuan.user.entity.CommentTree;
import cn.zzzyuan.user.entity.Info;
import cn.zzzyuan.user.mapper.CommentMapper;
import cn.zzzyuan.user.service.CommentService;
import cn.zzzyuan.user.entity.Comment;
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
    public List<CommentTree> selectByArticleGetComment(Integer id) {
        List<Comment> comments = this.list(new QueryWrapper<Comment>().eq("article_id", id).eq("status", 0));
        List<CommentTree> commentTrees = new ArrayList<>();
        if(comments == null || comments.size() == 0){
            return commentTrees;
        }

        ArrayList<Integer> integers = new ArrayList<>();
        for (Comment comment : comments) {
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
        List<Comment> collect = comments.stream().filter(e -> a.equals(e.getParentId())).collect(Collectors.toList());
        for (Comment comment : collect) {
            finalCommentTrees.add(CommentTree.builder().comment(comment).info(integerInfoHashMap.get(comment.getUserId())).level(0).build());
        }
        commentTrees = getCommentTree(finalCommentTrees.stream().sorted().collect(Collectors.toList()), comments, integerInfoHashMap,1);
        return commentTrees;
    }


    private List<CommentTree> getCommentTree(List<CommentTree> commentTrees, List<Comment> comments,Map<Integer, Info> integerInfoHashMap, Integer level){

        for (CommentTree commentTree : commentTrees) {
            List<CommentTree> childCommentTrees = new ArrayList<>();
            Integer parentId = commentTree.getComment().getId();
            List<Comment> collect = comments.stream().filter(e -> parentId.equals(e.getParentId())).collect(Collectors.toList());

            if (collect.size() != 0) {
                List<CommentTree> finalCommentTrees = new ArrayList<>();
                collect.forEach(e -> {
                    finalCommentTrees.add(CommentTree.builder().comment(e).info(integerInfoHashMap.get(e.getUserId())).level(level).build());
                });
                Collections.sort(finalCommentTrees);
                commentTree.setCommentTrees(getCommentTree(finalCommentTrees, comments, integerInfoHashMap,level + 1));
            }
        }
        return commentTrees;
    }

}

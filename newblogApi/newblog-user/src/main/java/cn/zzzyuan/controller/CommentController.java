package cn.zzzyuan.controller;


import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.entity.Comment;
import cn.zzzyuan.entity.CommentTree;
import cn.zzzyuan.entity.Info;
import cn.zzzyuan.entity.ResponseResult;
import cn.zzzyuan.service.CommentService;
import cn.zzzyuan.service.InfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * <p>
 * 评论表 前端控制器
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@RestController
@RequestMapping("/comment")
@Slf4j
public class CommentController {

    private final CommentService commentService;

    private final InfoService infoService;

    public CommentController(CommentService commentService, InfoService infoService) {
        this.commentService = commentService;
        this.infoService = infoService;
    }

    /**
     * 通过文章id查找对应的所属评论
     */
    @GetMapping("/get")
    public ResponseResult selectByArticleGetComment(@RequestParam(name = "id") Integer id){
        log.info("=====正在获取文章评论========");

        return ResponseResult.success(commentService.selectByArticleGetComment(id));
    }

    @GetMapping("/heat-list")
    public ResponseResult getCommentHeatList(@RequestParam(name = "num") Integer num){
        List<Comment> comments = commentService.list(new QueryWrapper<Comment>().orderByDesc("heat").last("limit 0," + num));
        ArrayList<Integer> users = new ArrayList<>();
        ArrayList<Integer> articles = new ArrayList<>();
        for (Comment comment : comments) {
            users.add(comment.getUserId());
        }
        List<Info> infos = infoService.list(new QueryWrapper<Info>().in("id", users)
                .select("avatar","name"));
        List<Map<String,Object>> mapList = new ArrayList<>();
        for (Comment comment : comments) {
            mapList.add(MapUtil.builder(new HashMap<String,Object>(2))
                    .put("comment", comment).put("info",infos ).build());
        }

        return ResponseResult.success(mapList);
    }


}

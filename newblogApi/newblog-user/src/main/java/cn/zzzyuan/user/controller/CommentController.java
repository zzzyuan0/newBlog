package cn.zzzyuan.user.controller;


import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.user.entity.Comment;
import cn.zzzyuan.user.entity.Info;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.user.service.CommentService;
import cn.zzzyuan.user.service.InfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Update;
import org.hashids.Hashids;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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

    private final Hashids hashids;

    public CommentController(CommentService commentService, InfoService infoService, Hashids hashids) {
        this.commentService = commentService;
        this.infoService = infoService;
        this.hashids = hashids;
    }

    /**
     * 通过文章id查找对应的所属评论
     */
    @GetMapping("/get")
    public ResponseResult selectByArticleGetComment(@RequestParam(name = "id") String id){
        log.info("=====正在获取文章评论========" + id);
        long[] decode = hashids.decode(id);
        if(decode.length != 0) {
            return ResponseResult.success(commentService.selectByArticleGetComment((int) decode[0]));
        }
       return ResponseResult.error(null);
    }

    @GetMapping("/heat-list")
    public ResponseResult getCommentHeatList(@RequestParam(name = "num") Integer num){
        List<Comment> comments = commentService.list(new QueryWrapper<Comment>().orderByDesc("heat").last("limit 0," + num));
        ArrayList<Integer> users = new ArrayList<>();
        ArrayList<Integer> articles = new ArrayList<>();
        for (Comment comment : comments) {
            users.add(comment.getUserId());
        }
        List<Map<String,Object>> mapList = new ArrayList<>(users.size());
        if(users.size() != 0) {
            List<Info> infos = infoService.list(new QueryWrapper<Info>().in("id", users)
                    .select("avatar","name"));
            for (Comment comment : comments) {
                mapList.add(MapUtil.builder(new HashMap<String,Object>(2))
                        .put("comment", comment).put("info",infos.size() != 0 ? infos.get(0) : new Info() ).build());
            }
        }

        return ResponseResult.success(mapList);
    }

    @GetMapping("/addHeat")
    public ResponseResult selectByArticleGetComment(@RequestParam(name = "id") Integer commentId){
        commentService.update(new UpdateWrapper<Comment>().eq("id", commentId).setSql("`heat` = `heat` + 1"));
        return ResponseResult.success();
    }


}

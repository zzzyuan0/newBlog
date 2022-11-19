package cn.zzzyuan.user.controller;


import cn.hutool.core.map.MapUtil;
import cn.zzzyuan.user.entity.Comment;
import cn.zzzyuan.user.entity.CommentUserLike;
import cn.zzzyuan.user.entity.Info;
import cn.zzzyuan.common.entity.ResponseResult;
import cn.zzzyuan.user.service.CommentService;
import cn.zzzyuan.user.service.CommentUserLikeService;
import cn.zzzyuan.user.service.InfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
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

    private final CommentUserLikeService commentUserLikeService;

    public CommentController(CommentService commentService, InfoService infoService,
                             Hashids hashids, CommentUserLikeService commentUserLikeService) {
        this.commentService = commentService;
        this.infoService = infoService;
        this.hashids = hashids;
        this.commentUserLikeService = commentUserLikeService;
    }

    /**
     * 通过文章id查找对应的所属评论
     */
    @GetMapping("/get")
    public ResponseResult selectByArticleGetComment(@RequestParam(name = "articleId") String articleId,
                                                    @RequestParam(name = "userId") Integer userId){
        long[] decode = hashids.decode(articleId);
        if(decode.length != 0) {
            return ResponseResult.success(commentService.selectByArticleAndUserIdGetComment((int) decode[0], userId));
        }
       return ResponseResult.error();
    }

    @GetMapping("/heat-list")
    public ResponseResult getCommentHeatList(@RequestParam(name = "num") Integer num){
        List<Comment> comments = commentService.list(new QueryWrapper<Comment>().orderByDesc("heat").last("limit 0," + num));
        ArrayList<Integer> users = new ArrayList<>();
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
    public ResponseResult addHeatByComment(@RequestParam(name = "commentId") Integer commentId,
                                                    @RequestParam(name = "userId") Integer userId){
        boolean b = commentUserLikeService.saveOrUpdate(new CommentUserLike().setCommentId(commentId).setUserId(userId),
                new UpdateWrapper<CommentUserLike>().set("comment_id", commentId).set("user_id", userId)
                        .eq("comment_id", commentId).eq("user_id", userId));
        if (b) {
            return ResponseResult.success();
        }
        return ResponseResult.error();
    }

    @GetMapping("/deleteHeat")
    public ResponseResult deleteHeatByComment(@RequestParam(name = "commentId") Integer commentId,
                                                    @RequestParam(name = "userId") Integer userId){
        boolean isRemove = commentUserLikeService.remove(new QueryWrapper<CommentUserLike>()
                .eq("comment_id", commentId).eq("user_id", userId));
        if (isRemove) {
            return ResponseResult.success();
        }
        return ResponseResult.error();
    }

    @PostMapping("/save")
    public ResponseResult saveComment(@RequestBody Map<String, String> req) {
        String articleId = req.get("articleId");
        if (StringUtils.isNotEmpty(articleId)) {
            long[] decode = hashids.decode(articleId);
            if (decode.length >= 1) {
                Comment comment = new Comment();
                comment.setArticleId((int) decode[0])
                        .setContent(MapUtil.getStr(req, "content"))
                        .setParentId(Integer.valueOf(req.getOrDefault("parentId", "0")))
                        .setUserId(Integer.valueOf(req.get("userId")))
                        .setStatus(Integer.valueOf(req.get("status")));
                boolean b = commentService.saveOrUpdate(comment);
                if (b) {
                    return ResponseResult.success();
                }
            }
        }
        return ResponseResult.error();
    }

    @GetMapping("/delete")
    public ResponseResult deleteComment(@RequestParam("commentId") Integer commentId,
                                        @RequestParam("userId") Integer userId) {
        boolean remove = commentService.remove(new QueryWrapper<Comment>().eq("id", commentId)
                .eq("user_id", userId));
        // 父评论删除成功
        if (remove) {
            // todo 仅删除了子评论，更下层级的未删
            commentService.remove(new QueryWrapper<Comment>().eq("parent_id", commentId));
            // 删除所有点赞记录
            commentUserLikeService.remove(new QueryWrapper<CommentUserLike>()
                    .eq("comment_id", commentId));
            return ResponseResult.success();
        }
        return ResponseResult.error();
    }

}

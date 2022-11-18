package cn.zzzyuan.user.entity;

import cn.zzzyuan.user.entity.Comment;
import cn.zzzyuan.user.entity.Info;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-05
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentTree implements Serializable,Comparable<CommentTree> {

    private UserIsLikeComment comment;

    private Info info;

    private List<CommentTree> commentTrees;

    private Integer level;

    @Override
    public int compareTo(CommentTree o) {
        return comment.getCreateTime().compareTo(o.comment.getCreateTime());
    }
}

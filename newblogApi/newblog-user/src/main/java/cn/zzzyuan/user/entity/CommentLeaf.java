package cn.zzzyuan.user.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-18
 */
@NoArgsConstructor
@Builder
@AllArgsConstructor
@Data
public class CommentLeaf implements Serializable,Comparable<CommentLeaf> {

    private UserIsLikeComment comment;

    private Info info;

    @Override
    public int compareTo(CommentLeaf o) {
        return comment.getCreateTime().compareTo(o.getComment().getCreateTime());
    }
}

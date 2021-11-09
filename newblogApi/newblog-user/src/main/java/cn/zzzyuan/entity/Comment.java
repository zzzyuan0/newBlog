package cn.zzzyuan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * <p>
 * 评论表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user_comment")
public class Comment implements Serializable ,Comparable<Comment> {

    private static final long serialVersionUID = 1L;

    /**
     * 评论id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 对应来源id 根据status
     */
    private Integer articleId;

    /**
     * 评论创建时间
     */
    private LocalDateTime createTime;

    /**
     * 评论最后一次回复时间
     */
    private LocalDateTime lastTime;

    /**
     * 父评论id
     */
    private Integer parentId;

    /**
     * 点赞热度
     */
    private Integer heat;

    /**
     * 是否可见 0 不可见 1可见
     */
    private Integer visibility;

    /**
     * 文章评论 0 论坛评论 1
     */
    private Integer status;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comment comment = (Comment) o;
        return Objects.equals(createTime, comment.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(createTime);
    }

    @Override
    public int compareTo(Comment o) {
        return createTime.compareTo(o.createTime);
    }
}

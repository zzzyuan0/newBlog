package cn.zzzyuan.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-17
 */
@AllArgsConstructor
@Data
@NoArgsConstructor
public class UserIsLikeComment implements Serializable {

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
     * 评论内容
     */
    private String content;

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
     * 是否可见 0 不可见 1可见
     */
    private Integer visibility;

    /**
     * 文章评论 0 论坛评论 1
     */
    private Integer status;

    /**
     * 热度
     */
    private Integer heat;

    /**
     * 用户是否点赞
     */
    private Boolean isLike;
}

package cn.zzzyuan.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 记录用户什么时候点赞了
 * </p>
 *
 * @author 
 * @since 2022-11-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user_comment_user_like")
public class CommentUserLike implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户评论联系id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 评论id
     */
    private Integer commentId;

    /**
     * 用户点赞时间
     */
    private LocalDateTime createTime;


}

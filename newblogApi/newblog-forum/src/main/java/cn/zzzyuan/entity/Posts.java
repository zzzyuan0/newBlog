package cn.zzzyuan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 *
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_forum_posts")
public class Posts implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 帖子id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 创建帖子的用户id
     */
    private Integer userId;

    /**
     * 点击量
     */
    private Integer heat;

    /**
     * 内容
     */
    private String content;

    /**
     * 帖子标题
     */
    private String title;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

    /**
     * 是否可见 1 可见 0 不可见
     */
    private Integer visibility;


}

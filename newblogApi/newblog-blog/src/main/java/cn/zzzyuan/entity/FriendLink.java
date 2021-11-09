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
 * 友链表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_blog_friend_link")
public class FriendLink implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 友链id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 好友名
     */
    private String name;

    /**
     * 好友博客链接
     */
    private String url;

    /**
     * 好友邮箱
     */
    private String email;

    /**
     * 好友头像
     */
    private String avatar;

    /**
     * 好友签名
     */
    private String sign;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 是否可见
     */
    private Integer visibility;


}

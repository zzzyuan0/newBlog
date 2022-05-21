package cn.zzzyuan.user.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 用户信息扩展表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user_ext")
public class Ext implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户经验值
     */
    private Integer experience;

    /**
     * 帖子总数
     */
    private Integer postNum;

    /**
     * 博客url
     */
    private String blogUrl;

    /**
     * 个人签名
     */
    private String sign;

    /**
     * 是否展示邮箱
     */
    private Integer showMail;

    private String extend1;


}

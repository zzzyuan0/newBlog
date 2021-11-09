package cn.zzzyuan.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户黑名单表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user_black_list")
public class BlackList implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 拉黑对象
     */
    private Integer blackUserId;

    /**
     * 时间
     */
    private LocalDateTime time;

    /**
     * 原因
     */
    private String remark;


}

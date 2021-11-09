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
 * 私信表
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_forum_private_letter")
public class PrivateLetter implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 私信id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 私信发送人
     */
    private Integer sendId;

    /**
     * 私信接收人
     */
    private Integer receiveId;

    /**
     * 发送时间
     */
    private LocalDateTime sendTime;

    /**
     * 接收时间
     */
    private LocalDateTime receiveTime;

    /**
     * 是否可见 1 0
     */
    private Integer visibility;


}

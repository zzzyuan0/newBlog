package cn.zzzyuan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_blog_img_url")
public class ImgUrl {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 图片Url
     */
    private String imgUrl;

}

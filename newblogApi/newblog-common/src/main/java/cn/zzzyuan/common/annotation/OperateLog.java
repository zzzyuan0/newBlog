package cn.zzzyuan.common.annotation;

import java.lang.annotation.*;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-26
 */
// 注解使用位置
@Target(ElementType.METHOD)
// 注解执行时间
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperateLog {

    // 操作模块
    String module() default "";

    // 操作类型
    int type() default -1;

    // 操作说明
    String desc() default "";

    // 参数类型
    String paramType() default "";

    // 参数说明
    String paramDesc() default "";

}

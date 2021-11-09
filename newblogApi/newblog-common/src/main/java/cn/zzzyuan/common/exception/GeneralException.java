package cn.zzzyuan.common.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-07
 */

//
//1. 此注解会生成equals(Object other) 和 hashCode()方法。
//
//2. 它默认使用非静态，非瞬态的属性
//
//3. 可通过参数exclude排除一些属性
//
//4. 可通过参数of指定仅使用哪些属性
//
//5. 它默认仅使用该类中定义的属性且不调用父类的方法
//
//6. 可通过callSuper=true解决上一点问题。让其生成的方法中调用父类的方法。
@EqualsAndHashCode(callSuper = true)
@Data
public class GeneralException extends RuntimeException {

    private Integer code;

    private String msg;

}

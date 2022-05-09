package cn.zzzyuan.user.aspect;

import cn.zzzyuan.common.aspect.LogOperateAspect;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-26
 */
@Component
public class LogOperate extends LogOperateAspect {
    public LogOperate(RabbitTemplate rabbitTemplate) {
        super(rabbitTemplate);
    }
}

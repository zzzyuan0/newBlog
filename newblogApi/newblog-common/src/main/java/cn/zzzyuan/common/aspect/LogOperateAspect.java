package cn.zzzyuan.common.aspect;


import cn.zzzyuan.common.annotation.OperateLog;
import cn.zzzyuan.common.entity.LogRecord;
import cn.zzzyuan.common.entity.ResponseResult;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-26
 */
@Slf4j
@Aspect
public class LogOperateAspect {

    private final RabbitTemplate rabbitTemplate;

    @Value("${mq.config.exchange.log}")
    private String exchange;

    @Value("${mq.config.queue.routing-key.log}")
    private String routingKey;

    public LogOperateAspect(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    /**
     * 设置切入点为注解位置
     */
    @Pointcut("@annotation(cn.zzzyuan.common.annotation.OperateLog)")
    public void logOperateCut(){

    }

    /**
     *  后置处理,注解函数返回后处理
     */
    @AfterReturning(value = "logOperateCut()",returning = "keys")
    public void saveOperateLog(JoinPoint joinPoint,Object keys){

        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        Map<String, String> paramMap = null;
        String param = "";
        String url = "";
        if(requestAttributes != null)  {
            HttpServletRequest httpServletRequest = (HttpServletRequest)requestAttributes.resolveReference(RequestAttributes.REFERENCE_REQUEST);

            if(httpServletRequest != null){
                Map<String, String[]> parameterMap = httpServletRequest.getParameterMap();
                paramMap = new HashMap<>(parameterMap.size());
                for (Map.Entry<String, String[]> stringEntry : parameterMap.entrySet()) {
                    paramMap.put(stringEntry.getKey(), stringEntry.getValue()[0]);
                }
                param = JSON.toJSONString(param);

                url = httpServletRequest.getRequestURI();
            }
        }

        ResponseResult responseResult = (ResponseResult) keys;
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        String className = joinPoint.getTarget().getClass().getName();
        Method method = signature.getMethod();
        String methodName = method.getName();

        ArrayList<Object> args = new ArrayList<>(Arrays.asList(joinPoint.getArgs()));
        StringBuilder params = new StringBuilder();

        for (int i = 0; i < args.size(); i++) {
            params.append("第").append(i + 1).append("个参数为：")
                    .append(JSON.toJSONStringWithDateFormat(args.get(i), "yyyy-MM-dd HH:mm:ss"));
        }

        OperateLog annotation = method.getAnnotation(OperateLog.class);
        String desc = annotation.desc();
        String module = annotation.module();
        String paramDesc = annotation.paramDesc();
        String paramType = annotation.paramType();
        int type = Integer.parseInt(annotation.type());
        LogRecord logRecord = LogRecord.builder()
                .remark(desc).method(methodName)
                .module(module).type(type)
                .param(params.toString()).paramType(paramType).paramRemark(paramDesc)
                .time(LocalDateTime.now()).url(url)
                .build();
        rabbitTemplate.convertAndSend(exchange, routingKey, logRecord);
        log.info("========日志发送成功======={}",param);
    }

    @AfterThrowing(pointcut = "logOperateCut()", throwing="e")
    public void saveThrowLog(JoinPoint joinPoint,Exception e){
        // todo 异常拦截
    }

}

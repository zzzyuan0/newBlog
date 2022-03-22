package cn.zzzyuan.three.consumer;

import cn.zzzyuan.common.entity.LogRecord;
import cn.zzzyuan.three.service.LogRecordService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-27
 */
@Service
@Slf4j
@RabbitListener(queues = {"${mq.config.queue.routing-key.log}"})
public class LogOperateConsumer {

    private final LogRecordService logRecordService;

    public LogOperateConsumer(LogRecordService logRecordService){
        this.logRecordService = logRecordService;
    }

    @RabbitHandler
    public void receiverLog(@Payload LogRecord logRecord){
      if (logRecord != null){
          log.info("=======日志保存成功======");
          logRecordService.save(logRecord);
      }
    }

}

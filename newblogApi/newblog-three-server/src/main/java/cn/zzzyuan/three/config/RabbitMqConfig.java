package cn.zzzyuan.three.config;

import com.rabbitmq.client.AMQP;
import com.sun.org.apache.regexp.internal.RE;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-11-07
 *   exchange:
 *       email: email.direct
 *       log: log.direct
 *     queue:
 *       routing-key:
 *         email: emial_queue
 *         log: log_queue
 */
@Configuration
public class RabbitMqConfig {

    @Value("${mq.config.queue.routing-key.log}")
    private String logQueue;

    @Value("${mq.config.queue.routing-key.email}")
    private String emailQueue;

    @Value("${mq.config.exchange.route}")
    private String routeExchange;

    public final RabbitTemplate rabbitTemplate;

    public RabbitMqConfig(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    @Bean
    public DirectExchange createExchange() {
        return new DirectExchange(routeExchange);
    }

    @Bean
    public Queue createLogQueue() {
        return QueueBuilder.durable(logQueue).build();
    }

    @Bean
    public Queue createEmailQueue() {
        return QueueBuilder.durable(emailQueue).build();
    }

    @Bean
    public Binding logBindRouteExchange(DirectExchange exchange) {
        return BindingBuilder.bind(createLogQueue()).to(exchange).with(logQueue);
    }

    @Bean
    public Binding emailBindRouteExchange(DirectExchange exchange) {
        return BindingBuilder.bind(createEmailQueue()).to(exchange).with(emailQueue);
    }

    @Bean
    public RabbitAdmin createRabbitAdmin() {
        RabbitAdmin rabbitAdmin = new RabbitAdmin(rabbitTemplate);
        rabbitAdmin.declareExchange(createExchange());
        rabbitAdmin.declareQueue(createEmailQueue());
        rabbitAdmin.declareQueue(createLogQueue());
        rabbitAdmin.declareBinding(logBindRouteExchange(createExchange()));
        rabbitAdmin.declareBinding(emailBindRouteExchange(createExchange()));
        return rabbitAdmin;
    }

}

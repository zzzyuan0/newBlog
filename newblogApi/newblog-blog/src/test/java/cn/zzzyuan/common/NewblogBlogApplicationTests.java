package cn.zzzyuan.common;

import cn.zzzyuan.entity.ImgUrl;
import cn.zzzyuan.service.ImgUrlService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.List;

@SpringBootTest
class NewblogBlogApplicationTests  {

    @Autowired
    private ImgUrlService imgUrlService;

    @Test
    void contextLoads() {
        List<ImgUrl> randomImg = imgUrlService.getRandomImg(5);
        randomImg.forEach(e -> {System.out.println(e.getImgUrl());});
        randomImg.forEach(System.out::print);
        // 获取bean的方式
        ApplicationContext context = new FileSystemXmlApplicationContext("xml");
        context.getBean("bean");
    }


}

package cn.zzzyuan.common;

import cn.zzzyuan.entity.ImgUrl;
import cn.zzzyuan.service.ImgUrlService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class NewblogBlogApplicationTests {

    @Autowired
    private ImgUrlService imgUrlService;

    @Test
    void contextLoads() {
        List<ImgUrl> randomImg = imgUrlService.getRandomImg(5);
        randomImg.forEach(e -> {System.out.println(e.getImgUrl());});
        randomImg.forEach(System.out::print);
    }

}

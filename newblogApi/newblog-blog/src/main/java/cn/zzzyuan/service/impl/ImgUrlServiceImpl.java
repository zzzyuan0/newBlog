package cn.zzzyuan.service.impl;

import cn.hutool.core.util.RandomUtil;
import cn.zzzyuan.entity.ImgUrl;
import cn.zzzyuan.mapper.ImgUrlMapper;
import cn.zzzyuan.service.ImgUrlService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author codesuperman@foxmail.com
 * @date 2022-02-05
 */
@Service
public class ImgUrlServiceImpl extends ServiceImpl<ImgUrlMapper, ImgUrl>  implements ImgUrlService {

    @Override
    public List<ImgUrl> getRandomImg(Integer num) {
        if (num == 0) {
            return new ArrayList<>();
        }
        int count = this.count();
        Set<Integer> set = new HashSet<>();
        for ( ; set.size() < num ; ) {
            set.add(RandomUtil.randomInt(0,count - 1));
        }
        return listByIds(set);
    }
}

package cn.zzzyuan.service.impl;

import cn.zzzyuan.entity.Info;
import cn.zzzyuan.mapper.InfoMapper;
import cn.zzzyuan.service.InfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户信息表 服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Service
public class InfoServiceImpl extends ServiceImpl<InfoMapper, Info> implements InfoService {

}

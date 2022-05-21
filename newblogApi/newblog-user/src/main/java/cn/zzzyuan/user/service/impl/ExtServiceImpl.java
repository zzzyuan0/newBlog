package cn.zzzyuan.user.service.impl;

import cn.zzzyuan.user.entity.Ext;
import cn.zzzyuan.user.mapper.ExtMapper;
import cn.zzzyuan.user.service.ExtService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户信息扩展表 服务实现类
 * </p>
 *
 * @author 杂货店的阿猿
 * @since 2021-11-11
 */
@Service
public class ExtServiceImpl extends ServiceImpl<ExtMapper, Ext> implements ExtService {

}

package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TjTencentMapper;
import com.ruoyi.system.domain.TjTencent;
import com.ruoyi.system.service.ITjTencentService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-07-21
 */
@Service
public class TjTencentServiceImpl implements ITjTencentService 
{
    @Autowired
    private TjTencentMapper tjTencentMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TjTencent selectTjTencentById(Long id)
    {
        return tjTencentMapper.selectTjTencentById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TjTencent> selectTjTencentList(TjTencent tjTencent)
    {
        return tjTencentMapper.selectTjTencentList(tjTencent);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTjTencent(TjTencent tjTencent)
    {
        return tjTencentMapper.insertTjTencent(tjTencent);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTjTencent(TjTencent tjTencent)
    {
        return tjTencentMapper.updateTjTencent(tjTencent);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTjTencentByIds(String ids)
    {
        return tjTencentMapper.deleteTjTencentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteTjTencentById(Long id)
    {
        return tjTencentMapper.deleteTjTencentById(id);
    }

    public TjTencent selectTjTencentByUserId(Long userId, String findDate) {
        return tjTencentMapper.selectTjTencentByUserId(userId,findDate);
    }

}

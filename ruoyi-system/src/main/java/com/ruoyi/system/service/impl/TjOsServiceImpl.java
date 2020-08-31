package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TjOsMapper;
import com.ruoyi.system.domain.TjOs;
import com.ruoyi.system.service.ITjOsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
@Service
public class TjOsServiceImpl implements ITjOsService 
{
    @Autowired
    private TjOsMapper tjOsMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TjOs selectTjOsById(Long id)
    {
        return tjOsMapper.selectTjOsById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjOs 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TjOs> selectTjOsList(TjOs tjOs)
    {
        return tjOsMapper.selectTjOsList(tjOs);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjOs 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTjOs(TjOs tjOs)
    {
        return tjOsMapper.insertTjOs(tjOs);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjOs 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTjOs(TjOs tjOs)
    {
        return tjOsMapper.updateTjOs(tjOs);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTjOsByIds(String ids)
    {
        return tjOsMapper.deleteTjOsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteTjOsById(Long id)
    {
        return tjOsMapper.deleteTjOsById(id);
    }
}

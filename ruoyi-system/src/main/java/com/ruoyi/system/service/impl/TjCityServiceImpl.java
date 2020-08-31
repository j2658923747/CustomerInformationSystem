package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TjCityMapper;
import com.ruoyi.system.domain.TjCity;
import com.ruoyi.system.service.ITjCityService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
@Service
public class TjCityServiceImpl implements ITjCityService 
{
    @Autowired
    private TjCityMapper tjCityMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TjCity selectTjCityById(Long id)
    {
        return tjCityMapper.selectTjCityById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjCity 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TjCity> selectTjCityList(TjCity tjCity)
    {
        return tjCityMapper.selectTjCityList(tjCity);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjCity 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTjCity(TjCity tjCity)
    {
        return tjCityMapper.insertTjCity(tjCity);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjCity 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTjCity(TjCity tjCity)
    {
        return tjCityMapper.updateTjCity(tjCity);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTjCityByIds(String ids)
    {
        return tjCityMapper.deleteTjCityByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteTjCityById(Long id)
    {
        return tjCityMapper.deleteTjCityById(id);
    }
}

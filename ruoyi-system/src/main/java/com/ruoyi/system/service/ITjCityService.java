package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.TjCity;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
public interface ITjCityService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TjCity selectTjCityById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjCity 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TjCity> selectTjCityList(TjCity tjCity);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjCity 【请填写功能名称】
     * @return 结果
     */
    public int insertTjCity(TjCity tjCity);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjCity 【请填写功能名称】
     * @return 结果
     */
    public int updateTjCity(TjCity tjCity);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTjCityByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTjCityById(Long id);
}

package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TjOs;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
public interface TjOsMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TjOs selectTjOsById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjOs 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TjOs> selectTjOsList(TjOs tjOs);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjOs 【请填写功能名称】
     * @return 结果
     */
    public int insertTjOs(TjOs tjOs);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjOs 【请填写功能名称】
     * @return 结果
     */
    public int updateTjOs(TjOs tjOs);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTjOsById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTjOsByIds(String[] ids);
}

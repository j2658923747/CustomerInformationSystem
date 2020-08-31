package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TjClient;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
public interface TjClientMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TjClient selectTjClientById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjClient 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TjClient> selectTjClientList(TjClient tjClient);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjClient 【请填写功能名称】
     * @return 结果
     */
    public int insertTjClient(TjClient tjClient);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjClient 【请填写功能名称】
     * @return 结果
     */
    public int updateTjClient(TjClient tjClient);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTjClientById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTjClientByIds(String[] ids);
}

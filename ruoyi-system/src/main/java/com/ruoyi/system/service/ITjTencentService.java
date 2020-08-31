package com.ruoyi.system.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.TjTencent;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-07-21
 */
public interface ITjTencentService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public TjTencent selectTjTencentById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<TjTencent> selectTjTencentList(TjTencent tjTencent);

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 结果
     */
    public int insertTjTencent(TjTencent tjTencent);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjTencent 【请填写功能名称】
     * @return 结果
     */
    public int updateTjTencent(TjTencent tjTencent);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTjTencentByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteTjTencentById(Long id);


    TjTencent selectTjTencentByUserId(Long userId, String findDate);
}

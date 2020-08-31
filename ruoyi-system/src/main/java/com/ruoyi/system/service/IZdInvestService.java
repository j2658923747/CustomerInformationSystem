package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ZdInvest;

/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2020-07-18
 */
public interface IZdInvestService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public ZdInvest selectZdInvestById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param zdInvest 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ZdInvest> selectZdInvestList(ZdInvest zdInvest);

    /**
     * 新增【请填写功能名称】
     *
     * @param zdInvest 【请填写功能名称】
     * @return 结果
     */
    public int insertZdInvest(ZdInvest zdInvest);

    /**
     * 修改【请填写功能名称】
     *
     * @param zdInvest 【请填写功能名称】
     * @return 结果
     */
    public int updateZdInvest(ZdInvest zdInvest);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteZdInvestByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteZdInvestById(Long id);
}

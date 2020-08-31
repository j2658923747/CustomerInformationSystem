package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ZdInvestMapper;
import com.ruoyi.system.domain.ZdInvest;
import com.ruoyi.system.service.IZdInvestService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-07-18
 */
@Service
public class ZdInvestServiceImpl implements IZdInvestService
{
    @Autowired
    private ZdInvestMapper zdInvestMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public ZdInvest selectZdInvestById(Long id)
    {
        return zdInvestMapper.selectZdInvestById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param zdInvest 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ZdInvest> selectZdInvestList(ZdInvest zdInvest)
    {
        return zdInvestMapper.selectZdInvestList(zdInvest);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param zdInvest 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertZdInvest(ZdInvest zdInvest)
    {
        return zdInvestMapper.insertZdInvest(zdInvest);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param zdInvest 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateZdInvest(ZdInvest zdInvest)
    {
        return zdInvestMapper.updateZdInvest(zdInvest);
    }

    /**
     * 删除【请填写功能名称】对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteZdInvestByIds(String ids)
    {
        return zdInvestMapper.deleteZdInvestByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteZdInvestById(Long id)
    {
        return zdInvestMapper.deleteZdInvestById(id);
    }
}

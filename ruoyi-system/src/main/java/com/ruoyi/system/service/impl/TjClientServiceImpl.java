package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TjClientMapper;
import com.ruoyi.system.domain.TjClient;
import com.ruoyi.system.service.ITjClientService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
@Service
public class TjClientServiceImpl implements ITjClientService 
{
    @Autowired
    private TjClientMapper tjClientMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public TjClient selectTjClientById(Long id)
    {
        return tjClientMapper.selectTjClientById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tjClient 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<TjClient> selectTjClientList(TjClient tjClient)
    {
        return tjClientMapper.selectTjClientList(tjClient);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tjClient 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTjClient(TjClient tjClient)
    {
        return tjClientMapper.insertTjClient(tjClient);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tjClient 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTjClient(TjClient tjClient)
    {
        return tjClientMapper.updateTjClient(tjClient);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTjClientByIds(String ids)
    {
        return tjClientMapper.deleteTjClientByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteTjClientById(Long id)
    {
        return tjClientMapper.deleteTjClientById(id);
    }
}

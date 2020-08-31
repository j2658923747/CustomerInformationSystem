package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 tj_os
 * 
 * @author ruoyi
 * @date 2020-07-22
 */
public class TjOs extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 操作系统 */
    @Excel(name = "操作系统")
    private String os;

    /** 操作系统名称 */
    @Excel(name = "操作系统名称")
    private String osName;

    /** 浏览量(PV) */
    @Excel(name = "浏览量(PV)")
    private Long pv;

    /** 独立用户(UV) */
    @Excel(name = "独立用户(UV)")
    private Long uv;

    /** 访问次数(VV) */
    @Excel(name = "访问次数(VV)")
    private Long vv;

    /** 独立IP */
    @Excel(name = "独立IP")
    private Long iv;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOs(String os) 
    {
        this.os = os;
    }

    public String getOs() 
    {
        return os;
    }
    public void setOsName(String osName) 
    {
        this.osName = osName;
    }

    public String getOsName() 
    {
        return osName;
    }
    public void setPv(Long pv) 
    {
        this.pv = pv;
    }

    public Long getPv() 
    {
        return pv;
    }
    public void setUv(Long uv) 
    {
        this.uv = uv;
    }

    public Long getUv() 
    {
        return uv;
    }
    public void setVv(Long vv) 
    {
        this.vv = vv;
    }

    public Long getVv() 
    {
        return vv;
    }
    public void setIv(Long iv) 
    {
        this.iv = iv;
    }

    public Long getIv() 
    {
        return iv;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("os", getOs())
            .append("osName", getOsName())
            .append("pv", getPv())
            .append("uv", getUv())
            .append("vv", getVv())
            .append("iv", getIv())
            .append("userId", getUserId())
            .toString();
    }
}

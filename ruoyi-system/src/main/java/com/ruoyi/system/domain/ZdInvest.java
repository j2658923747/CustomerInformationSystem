package com.ruoyi.system.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 zd_invest
 *
 * @author ruoyi
 * @date 2020-07-18
 */
public class ZdInvest extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private String outTradeNo;

    /** 充值金额 */
    @Excel(name = "充值金额")
    private Double totalAmount;

    /** 支付宝交易号 */
    @Excel(name = "支付宝交易号")
    private String alipayNo;

    /** 完成订单时间 */
    @Excel(name = "完成订单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date succeTime;

    /** 支付状态 */
    @Excel(name = "支付状态")
    private String type;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 充值产品 */
    @Excel(name = "充值产品")
    private String productType;

    /** 备注 */
    @Excel(name = "备注")
    private String remark;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setOutTradeNo(String outTradeNo)
    {
        this.outTradeNo = outTradeNo;
    }

    public String getOutTradeNo()
    {
        return outTradeNo;
    }
    public void setTotalAmount(Double totalAmount)
    {
        this.totalAmount = totalAmount;
    }

    public Double getTotalAmount()
    {
        return totalAmount;
    }
    public void setAlipayNo(String alipayNo)
    {
        this.alipayNo = alipayNo;
    }

    public String getAlipayNo()
    {
        return alipayNo;
    }
    public void setSucceTime(Date succeTime)
    {
        this.succeTime = succeTime;
    }

    public Date getSucceTime()
    {
        return succeTime;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "ZdInvest{" +
                "id=" + id +
                ", outTradeNo='" + outTradeNo + '\'' +
                ", totalAmount=" + totalAmount +
                ", alipayNo='" + alipayNo + '\'' +
                ", succeTime=" + succeTime +
                ", type='" + type + '\'' +
                ", userId=" + userId +
                ", productType='" + productType + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}

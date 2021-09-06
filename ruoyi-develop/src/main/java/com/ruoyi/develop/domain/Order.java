package com.ruoyi.develop.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单管理对象 t_order
 *
 * @author niaobulashi
 * @date 2021-04-28
 */
public class Order extends BaseEntity {
    private static final long serialVersionUID = 1L;
    
    /**
     * 主键
     */
    private String id;
    
    /**
     * 创建人
     */
    @Excel(name = "创建人")
    private String creator;
    
    /**
     * 修改人
     */
    @Excel(name = "修改人")
    private String editor;
    
    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date editTime;
    
    /**
     * 版本号
     */
    @Excel(name = "版本号")
    private Long version;
    
    /**
     * 软删除标识
     */
    private Long deleted;
    
    /**
     * 订单ID
     */
    @Excel(name = "订单ID")
    private String orderId;
    
    /**
     * 订单金额
     */
    @Excel(name = "订单金额")
    private BigDecimal amount;
    
    /**
     * 支付时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paymentTime;
    
    /**
     * 订单状态,0:处理中,1:支付成功,2:支付失败
     * 去掉dictType，11万条数据导出仅需10s
     */
//    @Excel(name = "订单状态", dictType="pay_status")
    @Excel(name = "订单状态")
    private Long orderStatus;
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getId() {
        return id;
    }
    
    public void setCreator(String creator) {
        this.creator = creator;
    }
    
    public String getCreator() {
        return creator;
    }
    
    public void setEditor(String editor) {
        this.editor = editor;
    }
    
    public String getEditor() {
        return editor;
    }
    
    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }
    
    public Date getEditTime() {
        return editTime;
    }
    
    public void setVersion(Long version) {
        this.version = version;
    }
    
    public Long getVersion() {
        return version;
    }
    
    public void setDeleted(Long deleted) {
        this.deleted = deleted;
    }
    
    public Long getDeleted() {
        return deleted;
    }
    
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    
    public String getOrderId() {
        return orderId;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }
    
    public Date getPaymentTime() {
        return paymentTime;
    }
    
    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public Long getOrderStatus() {
        return orderStatus;
    }
    
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("creator", getCreator())
                .append("editor", getEditor())
                .append("createTime", getCreateTime())
                .append("editTime", getEditTime())
                .append("version", getVersion())
                .append("deleted", getDeleted())
                .append("orderId", getOrderId())
                .append("amount", getAmount())
                .append("paymentTime", getPaymentTime())
                .append("orderStatus", getOrderStatus())
                .toString();
    }
}

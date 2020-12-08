package com.ruoyi.attendance.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 日报管理对象 t_daily
 *
 * @author niaobulashi
 * @date 2020-11-12
 */
public class TDaily extends BaseEntity {
    private static final long serialVersionUID = 1L;
    
    /**
     * 日报ID
     */
    private Long dailyId;
    
    /**
     * 用户ID
     */
    @Excel(name = "用户ID")
    private Long userId;
    
    /**
     * 日报时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日报时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dailyTime;
    
    /**
     * 日报内容
     */
    @Excel(name = "日报内容")
    private String daily;
    
    /**
     * 删除标识0-未删除1-已删除
     */
    private String delFlag;
    
    /**
     * 用户对象
     */
    private SysUser user;
    
    /**
     * 用户名称
     */
    private String nickName;
    
    /** 开始时间 */
    private String beginTime;
    
    /** 结束时间 */
    private String endTime;
    
    public void setDailyId(Long dailyId) {
        this.dailyId = dailyId;
    }
    
    public Long getDailyId() {
        return dailyId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public Long getUserId() {
        return userId;
    }
    
    public void setDailyTime(Date dailyTime) {
        this.dailyTime = dailyTime;
    }
    
    public Date getDailyTime() {
        return dailyTime;
    }
    
    public void setDaily(String daily) {
        this.daily = daily;
    }
    
    public String getDaily() {
        return daily;
    }
    
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
    
    public String getDelFlag() {
        return delFlag;
    }
    
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("dailyId", getDailyId())
                .append("userId", getUserId())
                .append("dailyTime", getDailyTime())
                .append("daily", getDaily())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
    
    public String getNickName() {
        return nickName;
    }
    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    
    public SysUser getUser() {
        return user;
    }
    
    public void setUser(SysUser user) {
        this.user = user;
    }
    
    public String getBeginTime() {
        return beginTime;
    }
    
    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }
    
    public String getEndTime() {
        return endTime;
    }
    
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}

package com.ruoyi.system.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工作日历对象 sys_calendar
 * 
 * @author niaobulashi
 * @date 2020-11-25
 */
public class SysCalendar extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自然日日期 */
    @Excel(name = "自然日日期")
    private String dateStr;

    /** 日期类型 */
    private String type;

    /** 日期描述 */
    @Excel(name = "日期描述")
    private String typeName;

    /** 年份 */
    @Excel(name = "年份")
    private String yearName;

    /** 农历 */
    @Excel(name = "农历")
    private String nongLiCn;

    /** 农历月份 */
    @Excel(name = "农历月份")
    private String nongLi;

    /** 生肖年 */
    @Excel(name = "生肖年")
    private String animalsYear;

    /** 节气 */
    @Excel(name = "节气")
    private String throttle;

    /** 周-中文 */
    @Excel(name = "周-中文")
    private String weekCn;

    /** 周期英文缩写 */
    private String week1;

    /** 周期数字 */
    private String week2;

    /** 周期英文 */
    @Excel(name = "周期英文")
    private String week3;

    /** 天数 */
    @Excel(name = "天数")
    private String dayNum;

    /** 周数 */
    @Excel(name = "周数")
    private String weekNum;

    /** 宜 */
    @Excel(name = "宜")
    private String suit;

    /** 忌 */
    @Excel(name = "忌")
    private String avoid;

    /** 假日描述 */
    @Excel(name = "假日描述")
    private String desc;
    
    private String beginTime;
    
    /** 结束时间 */
    private String endTime;
    
    /** 删除标识*/
    private String deleteFlag;

    public void setDateStr(String dateStr) 
    {
        this.dateStr = dateStr;
    }

    public String getDateStr() 
    {
        return dateStr;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }
    public void setYearName(String yearName) 
    {
        this.yearName = yearName;
    }

    public String getYearName() 
    {
        return yearName;
    }
    public void setNongLiCn(String nongLiCn) 
    {
        this.nongLiCn = nongLiCn;
    }

    public String getNongLiCn() 
    {
        return nongLiCn;
    }
    public void setNongLi(String nongLi) 
    {
        this.nongLi = nongLi;
    }

    public String getNongLi() 
    {
        return nongLi;
    }
    public void setAnimalsYear(String animalsYear) 
    {
        this.animalsYear = animalsYear;
    }

    public String getAnimalsYear() 
    {
        return animalsYear;
    }
    public void setThrottle(String throttle) 
    {
        this.throttle = throttle;
    }

    public String getThrottle() 
    {
        return throttle;
    }
    public void setWeekCn(String weekCn) 
    {
        this.weekCn = weekCn;
    }

    public String getWeekCn() 
    {
        return weekCn;
    }
    public void setWeek1(String week1) 
    {
        this.week1 = week1;
    }

    public String getWeek1() 
    {
        return week1;
    }
    public void setWeek2(String week2) 
    {
        this.week2 = week2;
    }

    public String getWeek2() 
    {
        return week2;
    }
    public void setWeek3(String week3) 
    {
        this.week3 = week3;
    }

    public String getWeek3() 
    {
        return week3;
    }
    public void setDayNum(String dayNum) 
    {
        this.dayNum = dayNum;
    }

    public String getDayNum() 
    {
        return dayNum;
    }
    public void setWeekNum(String weekNum) 
    {
        this.weekNum = weekNum;
    }

    public String getWeekNum() 
    {
        return weekNum;
    }
    public void setSuit(String suit) 
    {
        this.suit = suit;
    }

    public String getSuit() 
    {
        return suit;
    }
    public void setAvoid(String avoid) 
    {
        this.avoid = avoid;
    }

    public String getAvoid() 
    {
        return avoid;
    }
    public void setDesc(String desc) 
    {
        this.desc = desc;
    }

    public String getDesc() 
    {
        return desc;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dateStr", getDateStr())
            .append("type", getType())
            .append("typeName", getTypeName())
            .append("yearName", getYearName())
            .append("nongLiCn", getNongLiCn())
            .append("nongLi", getNongLi())
            .append("animalsYear", getAnimalsYear())
            .append("throttle", getThrottle())
            .append("weekCn", getWeekCn())
            .append("week1", getWeek1())
            .append("week2", getWeek2())
            .append("week3", getWeek3())
            .append("dayNum", getDayNum())
            .append("weekNum", getWeekNum())
            .append("suit", getSuit())
            .append("avoid", getAvoid())
            .append("desc", getDesc())
            .toString();
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
    
    public String getDeleteFlag() {
        return deleteFlag;
    }
    
    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
}

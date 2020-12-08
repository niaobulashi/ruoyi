package com.ruoyi.quartz.task;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysCalendar;
import com.ruoyi.system.service.ISysCalendarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @version V1.0
 * @Description: 自动任务获取工作日历数据
 * @author: niaobulashi
 * @date: 2020/12/08
 */
@Component("scheduleCalender")
public class ScheduleCalender {
    
    private static final Logger logger = LoggerFactory.getLogger(ScheduleCalender.class);
    
    @Autowired
    private ISysCalendarService sysCalendarService;
    
    /**
     * 自动任务获取工作日历数据
     */
    public void syncCalendar() {
        SysCalendar sysCalendar = new SysCalendar();
        sysCalendar.setBeginTime(DateUtils.firstDay());
        sysCalendar.setEndTime(DateUtils.lastDay());
        sysCalendarService.syncCalendar(sysCalendar);
    }
    
    /**
     * 自动任务获取工作日历数据
     * @param firstDay 开始日期 yyyyMMdd
     * @param lastDay 结束日期 yyyyMMdd
     */
    public void syncCalendar(String firstDay, String lastDay) {
        if (StringUtils.isNotEmpty(firstDay)
                && StringUtils.isNotEmpty(lastDay)
                && firstDay.compareTo(lastDay) > 0) {
            logger.info("自动任务获取工作日历数据传入参数有误！");
            return;
        }
        SysCalendar sysCalendar = new SysCalendar();
        sysCalendar.setBeginTime(firstDay);
        sysCalendar.setEndTime(lastDay);
        sysCalendarService.syncCalendar(sysCalendar);
    }
    
    public static void main(String[] args) {
        // 获取当月第一天和最后一天
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cale = null;
        cale = Calendar.getInstance();
        String firstday, lastday;
        // 获取前月的第一天
        cale = Calendar.getInstance();
        cale.add(Calendar.MONTH, 0);
        cale.set(Calendar.DAY_OF_MONTH, 1);
        firstday = format.format(cale.getTime());
        // 获取前月的最后一天
        cale = Calendar.getInstance();
        cale.add(Calendar.MONTH, 1);
        cale.set(Calendar.DAY_OF_MONTH, 0);
        lastday = format.format(cale.getTime());
        System.out.println("本月第一天和最后一天分别是 ： " + firstday + " and " + lastday);
    }
    
}

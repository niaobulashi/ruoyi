package com.ruoyi.web.controller.system;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysCalendar;
import com.ruoyi.system.service.ISysCalendarService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工作日历Controller
 * 
 * @author niaobulashi
 * @date 2020-11-25
 */
@RestController
@RequestMapping("/system/calendar")
public class SysCalendarController extends BaseController
{
    @Autowired
    private ISysCalendarService sysCalendarService;

    /**
     * 查询工作日历列表
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCalendar sysCalendar)
    {
        startPage();
        List<SysCalendar> list = sysCalendarService.selectSysCalendarList(sysCalendar);
        return getDataTable(list);
    }

    /**
     * 导出工作日历列表
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:export')")
    @Log(title = "工作日历", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysCalendar sysCalendar)
    {
        List<SysCalendar> list = sysCalendarService.selectSysCalendarList(sysCalendar);
        ExcelUtil<SysCalendar> util = new ExcelUtil<SysCalendar>(SysCalendar.class);
        return util.exportExcel(list, "calendar");
    }

    /**
     * 获取工作日历详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:query')")
    @GetMapping(value = "/{dateStr}")
    public AjaxResult getInfo(@PathVariable("dateStr") String dateStr)
    {
        return AjaxResult.success(sysCalendarService.selectSysCalendarById(dateStr));
    }

    /**
     * 新增工作日历
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:add')")
    @Log(title = "工作日历", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCalendar sysCalendar)
    {
        return toAjax(sysCalendarService.insertSysCalendar(sysCalendar));
    }

    /**
     * 修改工作日历
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:edit')")
    @Log(title = "工作日历", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCalendar sysCalendar)
    {
        return toAjax(sysCalendarService.updateSysCalendar(sysCalendar));
    }

    /**
     * 删除工作日历
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:remove')")
    @Log(title = "工作日历", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dateStrs}")
    public AjaxResult remove(@PathVariable String[] dateStrs)
    {
        return toAjax(sysCalendarService.deleteSysCalendarByIds(dateStrs));
    }
    
    /**system:calendar:doSync
     * 同步工作日历信息
     */
    @PreAuthorize("@ss.hasPermi('system:calendar:doSync')")
    @Log(title = "工作日历", businessType = BusinessType.SYNC)
    @PostMapping("/dateSyncRange")
    public void syncCalendar(@RequestBody SysCalendar sysCalendar)
    {
        sysCalendarService.syncCalendar(sysCalendar);
    }
}

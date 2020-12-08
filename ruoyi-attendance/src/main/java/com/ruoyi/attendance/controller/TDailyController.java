package com.ruoyi.attendance.controller;

import java.util.List;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.framework.web.service.TokenService;
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
import com.ruoyi.attendance.domain.TDaily;
import com.ruoyi.attendance.service.ITDailyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 日报管理Controller
 *
 * @author niaobulashi
 * @date 2020-11-12
 */
@RestController
@RequestMapping("/attendance/daily")
public class TDailyController extends BaseController {
    @Autowired
    private ITDailyService tDailyService;
    
    @Autowired
    private TokenService tokenService;
    
    /**
     * 查询日报管理列表
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:list')")
    @GetMapping("/list")
    public TableDataInfo list(TDaily tDaily) {
        startPage();
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        List<TDaily> list = tDailyService.selectTDailyList(tDaily, loginUser);
        return getDataTable(list);
    }
    
    /**
     * 导出日报管理列表
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:export')")
    @Log(title = "日报管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TDaily tDaily) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        List<TDaily> list = tDailyService.selectTDailyList(tDaily, loginUser);
        ExcelUtil<TDaily> util = new ExcelUtil<TDaily>(TDaily.class);
        return util.exportExcel(list, "daily");
    }
    
    /**
     * 获取日报管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:query')")
    @GetMapping(value = "/{dailyId}")
    public AjaxResult getInfo(@PathVariable("dailyId") Long dailyId) {
        return AjaxResult.success(tDailyService.selectTDailyById(dailyId));
    }
    
    /**
     * 新增日报管理
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:add')")
    @Log(title = "日报管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TDaily tDaily) {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        return toAjax(tDailyService.insertTDaily(tDaily, loginUser));
    }
    
    /**
     * 修改日报管理
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:edit')")
    @Log(title = "日报管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TDaily tDaily) {
        return toAjax(tDailyService.updateTDaily(tDaily));
    }
    
    /**
     * 删除日报管理
     */
    @PreAuthorize("@ss.hasPermi('attendance:daily:remove')")
    @Log(title = "日报管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dailyIds}")
    public AjaxResult remove(@PathVariable Long[] dailyIds) {
        return toAjax(tDailyService.deleteTDailyByIds(dailyIds));
    }
}

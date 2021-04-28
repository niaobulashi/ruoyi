package com.ruoyi.develop.controller;

import java.util.List;

import com.ruoyi.develop.domain.Order;
import com.ruoyi.develop.service.IOrderService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单管理Controller
 *
 * @author niaobulashi
 * @date 2021-04-28
 */
@RestController
@RequestMapping("/develop/order")
public class OrderController extends BaseController {
    @Autowired
    private IOrderService orderService;
    
    /**
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('develop:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(Order order) {
        startPage();
        List<Order> list = orderService.selectOrderList(order);
        return getDataTable(list);
    }
    
    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('develop:order:export')")
    @Log(title = "订单管理" , businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Order order) {
        List<Order> list = orderService.selectOrderList(order);
        ExcelUtil<Order> util = new ExcelUtil<Order>(Order.class);
        return util.exportExcel(list, "订单管理数据");
    }
    
    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('develop:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return AjaxResult.success(orderService.selectOrderById(id));
    }
    
    /**
     * 新增订单管理
     */
    @PreAuthorize("@ss.hasPermi('develop:order:add')")
    @Log(title = "订单管理" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Order order) {
        return toAjax(orderService.insertOrder(order));
    }
    
    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('develop:order:edit')")
    @Log(title = "订单管理" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Order order) {
        return toAjax(orderService.updateOrder(order));
    }
    
    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('develop:order:remove')")
    @Log(title = "订单管理" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(orderService.deleteOrderByIds(ids));
    }
}

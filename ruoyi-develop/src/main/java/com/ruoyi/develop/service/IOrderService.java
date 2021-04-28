package com.ruoyi.develop.service;

import java.util.List;

import com.ruoyi.develop.domain.Order;

/**
 * 订单管理Service接口
 *
 * @author niaobulashi
 * @date 2021-04-28
 */
public interface IOrderService {
    /**
     * 查询订单管理
     *
     * @param id 订单管理ID
     * @return 订单管理
     */
    public Order selectOrderById(String id);
    
    /**
     * 查询订单管理列表
     *
     * @param order 订单管理
     * @return 订单管理集合
     */
    public List<Order> selectOrderList(Order order);
    
    /**
     * 新增订单管理
     *
     * @param order 订单管理
     * @return 结果
     */
    public int insertOrder(Order order);
    
    /**
     * 修改订单管理
     *
     * @param order 订单管理
     * @return 结果
     */
    public int updateOrder(Order order);
    
    /**
     * 批量删除订单管理
     *
     * @param ids 需要删除的订单管理ID
     * @return 结果
     */
    public int deleteOrderByIds(String[] ids);
    
    /**
     * 删除订单管理信息
     *
     * @param id 订单管理ID
     * @return 结果
     */
    public int deleteOrderById(String id);
    
    /**
     * 批量新增订单数据
     * @return
     */
    //public long batchInsertOrder();
}

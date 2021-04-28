package com.ruoyi.develop.mapper;

import com.ruoyi.develop.domain.Order;

import java.util.List;

/**
 * 订单管理Mapper接口
 *
 * @author niaobulashi
 * @date 2021-04-28
 */
public interface OrderMapper {
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
     * 删除订单管理
     *
     * @param id 订单管理ID
     * @return 结果
     */
    public int deleteOrderById(String id);
    
    /**
     * 批量删除订单管理
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrderByIds(String[] ids);
}

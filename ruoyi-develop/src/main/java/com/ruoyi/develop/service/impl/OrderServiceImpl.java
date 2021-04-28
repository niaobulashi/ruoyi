package com.ruoyi.develop.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.develop.domain.Order;
import com.ruoyi.develop.mapper.OrderMapper;
import com.ruoyi.develop.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 订单管理Service业务层处理
 *
 * @author niaobulashi
 * @date 2021-04-28
 */
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    
    /**
     * 查询订单管理
     *
     * @param id 订单管理ID
     * @return 订单管理
     */
    @Override
    public Order selectOrderById(String id) {
        return orderMapper.selectOrderById(id);
    }
    
    /**
     * 查询订单管理列表
     *
     * @param order 订单管理
     * @return 订单管理
     */
    @Override
    public List<Order> selectOrderList(Order order) {
        return orderMapper.selectOrderList(order);
    }
    
    /**
     * 新增订单管理
     *
     * @param order 订单管理
     * @return 结果
     */
    @Override
    public int insertOrder(Order order) {
        order.setCreateTime(DateUtils.getNowDate());
        return orderMapper.insertOrder(order);
    }
    
    /**
     * 修改订单管理
     *
     * @param order 订单管理
     * @return 结果
     */
    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }
    
    /**
     * 批量删除订单管理
     *
     * @param ids 需要删除的订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrderByIds(String[] ids) {
        return orderMapper.deleteOrderByIds(ids);
    }
    
    /**
     * 删除订单管理信息
     *
     * @param id 订单管理ID
     * @return 结果
     */
    @Override
    public int deleteOrderById(String id) {
        return orderMapper.deleteOrderById(id);
    }
    
    /**
     * 批量新增订单数据
     *
     * @return 结果
     */
    /*@Override
    public long batchInsertOrder() {
        //初始化1000000条数据
        List<List> data = createList(1000000);
        Long startTime = System.currentTimeMillis();
        String addSql = "insert into aaa (first, second, three, four,five) VALUES(?,?,?,?,?)";
        String updateSql = "update aaa set first = ?,second=?,three=?,four=?,five=? where id = ?";
        jdbcTemplate.batchUpdate(addSql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, data.get(i).get("first"));
                ps.setString(2, data.get(i).get("second"));
                ps.setString(3, data.get(i).get("three"));
                ps.setString(4, data.get(i).get("four"));
                ps.setString(5, data.get(i).get("five"));
            }
            @Override
            public int getBatchSize() {
                return data.size();
            }
        });
        Long endTime = System.currentTimeMillis();
        System.out.println("插入"+data.size()+"条数据用时：" + (endTime - startTime) + "毫秒");
        System.out.println("插入"+data.size()+"条数据用时：" + (endTime - startTime) / 1000 + "秒");
        return data.size();
    }*/
}

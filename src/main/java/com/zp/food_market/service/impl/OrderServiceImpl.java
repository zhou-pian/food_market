package com.zp.food_market.service.impl;

import com.zp.food_market.mapper.OrderMapper;
import com.zp.food_market.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public List<Map<String, Object>> selectAllOrdersByUserId(Integer userId) {
        return orderMapper.selectAllOrdersByUserId(userId);
    }

    @Override
    public int insertOrder(Map<String, Object> map) {
        return orderMapper.insertOrder(map);
    }

    @Override
    public int selectUserManageCount() {
        return orderMapper.selectUserManageCount();
    }

    @Override
    public List<Map<String, Object>> selectUserManageList(Map<String, Object> map) {
        return orderMapper.selectUserManageList(map);
    }

    @Override
    public int updateOrderStatus(Integer orderId) {
        return orderMapper.updateOrderStatus(orderId);
    }

    @Override
    public int deleteorder(List<String> list) {
        return orderMapper.deleteorder(list);
    }
}

package com.zp.food_market.service;

import java.util.List;
import java.util.Map;

public interface OrderService {
    public List<Map<String,Object>> selectAllOrdersByUserId(Integer userId);
    public int insertOrder (Map<String,Object> map);
    public int selectUserManageCount();
    public List<Map<String,Object>> selectUserManageList(Map<String,Object> map);
    public int updateOrderStatus(Integer orderId);
    public int deleteorder(List<String> list);
}

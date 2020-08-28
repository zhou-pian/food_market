package com.zp.food_market.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {
    public List<Map<String,Object>> selectAllOrdersByUserId(Integer userId);
    public int insertOrder (Map<String,Object> map);
    public int selectUserManageCount();
    public List<Map<String,Object>> selectUserManageList(Map<String,Object> map);
    public int updateOrderStatus(Integer orderId);
    public int deleteorder(List<String> list);
}

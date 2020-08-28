package com.zp.food_market.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public Map<String,Object> findByNameandPasswd(@Param("name") String name, @Param("passwd") String passwd);

    public int insertUser(Map<String,Object> map);

    public Map<String,Object> findByName(String userName);

    public int updatePasswd(Map<String,Object> map);

    public List<Map<String,Object>> selectListByUserId(Integer userId);

    public int insertShoppingList(Map<String,Object> map);

    public int shoppingListCount(Integer userId);

    public int setQuantity1(Integer shoppingListId);

    public int setQuantity2(Integer shoppingListId);

    public int setQuantity3(Integer shoppingListId,Integer quantity);

    public int deleteShoppingList(List<String> list);

    public Map<String,Object> selectListByProductAndUse(Integer userId,Integer productId);

    public Integer selectProductByShoppingListId(Integer shoppingListId);

    public Integer selectQuantityByShoppingListId(Integer shoppingListId);
}

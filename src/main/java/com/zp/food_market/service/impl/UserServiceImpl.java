package com.zp.food_market.service.impl;

import com.zp.food_market.mapper.UserMapper;
import com.zp.food_market.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Map<String, Object> findByNameandPasswd(String name, String passwd) {
        return userMapper.findByNameandPasswd(name,passwd);
    }

    @Override
    public int insertUser(Map<String, Object> map) {
        return userMapper.insertUser(map);
    }

    @Override
    public Map<String, Object> findByName(String userName) {
        return userMapper.findByName(userName);
    }

    @Override
    public int updatePasswd(Map<String, Object> map) {
        return userMapper.updatePasswd(map);
    }

    @Override
    public List<Map<String, Object>> selectListByUserId(Integer userId) {
        return userMapper.selectListByUserId(userId);
    }

    @Override
    public int insertShoppingList(Map<String, Object> map) {
        return userMapper.insertShoppingList(map);
    }

    @Override
    public int shoppingListCount(Integer userId) {
        return userMapper.shoppingListCount(userId);
    }

    @Override
    public int setQuantity1(Integer shoppingListId) {
        return userMapper.setQuantity1(shoppingListId);
    }

    @Override
    public int setQuantity2(Integer shoppingListId) {
        return userMapper.setQuantity2(shoppingListId);
    }

    @Override
    public int setQuantity3(Integer shoppingListId, Integer quantity) {
        return userMapper.setQuantity3(shoppingListId,quantity);
    }

    @Override
    public int deleteShoppingList(List<String> list) {
        return userMapper.deleteShoppingList(list);
    }

    @Override
    public Map<String, Object> selectListByProductAndUse(Integer userId, Integer productId) {
        return userMapper.selectListByProductAndUse(userId,productId);
    }

    @Override
    public Integer selectProductByShoppingListId(Integer shoppingListId) {
        return userMapper.selectProductByShoppingListId(shoppingListId);
    }

    @Override
    public Integer selectQuantityByShoppingListId(Integer shoppingListId) {
        return userMapper.selectQuantityByShoppingListId(shoppingListId);
    }
}

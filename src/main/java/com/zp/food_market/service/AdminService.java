package com.zp.food_market.service;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface AdminService {
    public Map<String,Object> findByNameandPasswd(@Param("name") String name, @Param("passwd") String passwd);
}

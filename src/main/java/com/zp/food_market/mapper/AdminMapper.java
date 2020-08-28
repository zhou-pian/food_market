package com.zp.food_market.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface AdminMapper {
    public Map<String,Object> findByNameandPasswd(@Param("name") String name, @Param("passwd") String passwd);
}

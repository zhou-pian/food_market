package com.zp.food_market.service.impl;

import com.zp.food_market.mapper.AdminMapper;
import com.zp.food_market.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Map<String, Object> findByNameandPasswd(String name, String passwd) {
        return adminMapper.findByNameandPasswd(name,passwd);
    }
}

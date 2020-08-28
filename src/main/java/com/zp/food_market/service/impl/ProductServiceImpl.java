package com.zp.food_market.service.impl;

import com.zp.food_market.mapper.ProductMapper;
import com.zp.food_market.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> selectAllProduct() {
        return productMapper.selectAllProduct();
    }

    @Override
    public List<Map<String, Object>> selectProductByCategory(Integer categoryId) {
        return productMapper.selectProductByCategory(categoryId);
    }

    @Override
    public List<Map<String, Object>> selectProductByName(Map<String,Object> map) {
        return productMapper.selectProductByName(map);

    }

//    @Override
//    public int insertProduct(Map<String, Object> map) {
//        return productMapper.insertProduct(map);
//    }
//    @Override
//    public int updateProduct(Map<String, Object> map) {
//        return productMapper.updateProduct(map);
//    }

    @Override
    public int insertUpdate(Map<String, Object> map) {
        //所有的判断均在这一层写，不允许在Controller里做
        int count = 0;
        if(map.get("productId") == null || map.get("productId").toString().equals("")){
            count = productMapper.insertProduct(map);
        }
        else
        {
            count = productMapper.updateProduct(map);
        }
        return count;
    }

    @Override
    public int insertUpdatePhoto(Map<String, Object> map) {
        int count = 0;
        if(map.get("productId") == null || map.get("productId").toString().equals("")){
            count = productMapper.insertPhoto(map);
        }
        else
        {
            String photoNumber = productMapper.selectPhotoNumberById(map);
            map.put("photoNumber1",photoNumber);
            count = productMapper.updatePhoto(map);
        }
        return count;
    }

    @Override
    public int deleteProduct(List<String> list) {
        return productMapper.deleteProduct(list);
    }

    @Override
    public Map<String, Object> selectProductById(Integer productId) {
        return productMapper.selectProductById(productId);
    }

//    @Override
//    public int insertPhoto(Map<String, Object> map) {
//        return productMapper.insertPhoto(map);
//    }

    @Override
    public List<Map<String, Object>> selectUserManageList(Map<String, Object> map) {
        return productMapper.selectUserManageList(map);
    }


    @Override
    public int selectUserManageCount(Map<String, Object> map) {
        return productMapper.selectUserManageCount(map);
    }

    @Override
    public List<Map<String,Object>> selectCategory() {
        return productMapper.selectCategory();
    }

    @Override
    public List<Map<String, Object>> selectActiveProduct() {
        return productMapper.selectActiveProduct();
    }

    @Override
    public List<Map<String, Object>> selectHotProduct() {
        return productMapper.selectHotProduct();
    }

    @Override
    public List<Map<String, Object>> selectNewProduct() {
        return productMapper.selectNewProduct();
    }


}

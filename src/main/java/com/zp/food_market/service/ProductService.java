package com.zp.food_market.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
    /**
     * 查找所有商品
     * @return
     */
    public List<Map<String,Object>> selectAllProduct();

    /**
     * 根据类型查询商品
     * @param categoryId
     * @return
     */
    public List<Map<String,Object>> selectProductByCategory(Integer categoryId);

    /**
     * 根据名称模糊查询商品（搜索功能）
     * @return
     */
    public List<Map<String,Object>> selectProductByName(Map<String,Object> map);


    /**
     * 插入新商品
     * @param map
     * @return
     */
//    public int insertProduct(Map<String,Object> map);
//
//    public int updateProduct(Map<String,Object> map);
    public int insertUpdate(Map<String, Object> map);
    public int insertUpdatePhoto(Map<String,Object> map);
    public int deleteProduct(List<String> list);

//    /**
//     * 插入某商品的图片
//     * @param map
//     * @return
//     */
//    public int insertPhoto(Map<String,Object> map);

    public Map<String,Object> selectProductById(Integer productId);

    public  List<Map<String,Object>> selectUserManageList(Map<String,Object> map);

    public int selectUserManageCount(Map<String,Object> map);

    public List<Map<String,Object>> selectCategory();

    public List<Map<String,Object>> selectActiveProduct();

    public List<Map<String,Object>> selectHotProduct();

    public List<Map<String,Object>> selectNewProduct();
}

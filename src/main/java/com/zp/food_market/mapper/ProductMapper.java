package com.zp.food_market.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    /**
     * 查找某店铺的所有商品
     * @return
     */
    public List<Map<String,Object>> selectAllProduct();

    /**
     * 根据类型查询某店铺的所有商品
     * @param categoryId
     * @return
     */
    public List<Map<String,Object>> selectProductByCategory(Integer categoryId);

    /**
     * 根据名称模糊查询某店铺的所有商品（搜索功能）
     * @return
     */
    public List<Map<String,Object>> selectProductByName(Map<String,Object> map);


    /**
     * 插入新商品
     * @param map
     * @return
     */
    public int insertProduct(Map<String,Object> map);

    /**
     * 插入某商品的图片
     * @param map
     * @return
     */
    public int insertPhoto(Map<String,Object> map);
    public int updatePhoto(Map<String,Object> map);

    public int updateProduct(Map<String,Object> map);

    public String selectPhotoNumberById(Map<String,Object> map);
    public Map<String,Object> selectProductById(Integer productId);
    public int deleteProduct(List<String> list);

    public  List<Map<String,Object>> selectUserManageList(Map<String,Object> map);

    public int selectUserManageCount(Map<String,Object> map);

    public List<Map<String,Object>> selectCategory();

    public List<Map<String,Object>> selectActiveProduct();

    public List<Map<String,Object>> selectHotProduct();

    public List<Map<String,Object>> selectNewProduct();

}

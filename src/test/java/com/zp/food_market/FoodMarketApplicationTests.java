package com.zp.food_market;

import com.zp.food_market.service.impl.ProductServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

@SpringBootTest
class FoodMarketApplicationTests {

//    @Autowired
//    private ProductServiceImpl productService;
//    @Test
//    public void testSelectAll() {
//        List<Map<String,Object>> list = productService.selectAllProduct("良品铺子");
//        System.out.println(list);
//    }
//
//    @Test
//    public void testSelectByCategory(){
//        List<Map<String,Object>> list = productService.selectProductByCategory(2,"良品铺子");
//        System.out.println(list);
//    }
//生成随机字母数字组合
public String getCharAndNumr(int length) {

    StringBuffer valSb = new StringBuffer();

    for (int i = 0; i < length; i++) {

        String charOrNum = Math.round(Math.random()) % 2 == 0 ? "char" : "num"; // 输出字母还是数字

        if ("char".equalsIgnoreCase(charOrNum)) {

            // 字符串

            int choice = Math.round(Math.random()) % 2 == 0 ? 65 : 97;  // 取得大写字母还是小写字母

            valSb.append((char) (choice + Math.round(Math.random()*25)));

        } else if ("num".equalsIgnoreCase(charOrNum)) {

            // 数字

            valSb.append(String.valueOf(Math.round(Math.random()*9)));

        }

    }

    return valSb.toString();

}
    @Test
    public void test(){
        String charAndNumr = getCharAndNumr(10);
        System.out.println(charAndNumr);
    }

}

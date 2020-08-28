package com.zp.food_market.controller;

import com.zp.food_market.service.impl.OrderServiceImpl;
import com.zp.food_market.service.impl.ProductServiceImpl;
import com.zp.food_market.service.impl.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController extends BaseController {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private OrderServiceImpl orderService;

    //跳转到主页
    @RequestMapping("/index")
    public ModelAndView index(){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("list",productService.selectAllProduct());
        map.put("list1",productService.selectActiveProduct());
        map.put("list2",productService.selectHotProduct());
        map.put("list3",productService.selectNewProduct());
        int count = listCount();
        map.put("count",count);
        //判断是否登录
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("index",map);
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam("search_content") String text){
        Map<String,Object> map = new HashMap<String,Object>();
        Map<String,Object> map2 = new HashMap<String,Object>();
        map2.put("productTitle",text);
        map.put("list",productService.selectProductByName(map2));
        map.put("list1",productService.selectActiveProduct());
        map.put("list2",productService.selectHotProduct());
        map.put("list3",productService.selectNewProduct());
        int count = listCount();
        map.put("count",count);
        //判断是否登录
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("index",map);
    }

    @RequestMapping("/selectByCategoryId")
    public ModelAndView selectByCategoryId(@RequestParam("categoryId") Integer categoryId){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("list",productService.selectProductByCategory(categoryId));
        map.put("list1",productService.selectActiveProduct());
        map.put("list2",productService.selectHotProduct());
        map.put("list3",productService.selectNewProduct());
        int count = listCount();
        map.put("count",count);
        //判断是否登录
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("index",map);
    }

    @RequestMapping("/goods")
    public ModelAndView goods(@RequestParam("productId") Integer productId){
        log.info("productId----"+productId);
        Map<String,Object> map = productService.selectProductById(productId);

        int count = listCount();
        map.put("count",count);
        //判断是否登录
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("goods",map);
    }

    @ResponseBody
    @RequestMapping("/checkLogin")
    public String checkLogin(){
        HttpSession session = request.getSession();
        Map<String,Object> map = (Map<String, Object>) session.getAttribute("userMap");
        log.info("user----"+map);
        if(map!=null){
            return "{\"msg\":\"true\"}";
        }
        else{
            return "{\"msg\":\"false\"}";
        }
    }

    @RequestMapping("/confirmOrder")
    public ModelAndView confirmOrder(@RequestParam("productId") Integer productId, @RequestParam("quantity") Integer quantity){
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map2 = userService.findByName((String) map1.get("user_name"));

        log.info(productId+"-------"+quantity);
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> map3 = productService.selectProductById(productId);
        Double totalPrice = (Double)map3.get("productNewPrice") * quantity;
        map3.put("quantity",quantity);
        map3.put("totalPrice",totalPrice);
        list.add(map3);
        log.info("list----"+list);
        map.put("list",list);
        map.put("total",totalPrice);
        map.put("userName",map2.get("user_name"));
        map.put("userphone",map2.get("user_phone"));
        map.put("userAddress",map2.get("user_address"));
        map.put("productId",productId);
        map.put("quantity",quantity);
        map.put("index",1);

        int count = listCount();
        map.put("count",count);
        //判断是否登录
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new  ModelAndView("pay",map);
    }

    @RequestMapping("/inserOrder")
    public String inserOrder(@RequestParam("productId") Integer productId,@RequestParam("quantity") Integer quantity,@RequestParam("text") String text){
        if(text.equals("")){
            text = "无";
        }
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map = new HashMap<>();
        map.put("userId",map1.get("user_id"));
        map.put("productId",productId);
        map.put("quantity",quantity);
        map.put("orderNote",text);
        log.info("order---"+map);
        int count = orderService.insertOrder(map);
        return "redirect:/user/orderlist";
    }

    @RequestMapping("/insertShoppingList")
    public String insertShoppingList(@RequestParam("productId") Integer productId,@RequestParam("quantity") Integer quantity){
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map2 = userService.selectListByProductAndUse((Integer)map1.get("user_id"),productId);
        if(map2 !=null){
            userService.setQuantity3((Integer) map2.get("shopping_list_id"),quantity);
        }else{
            Map<String,Object> map = new HashMap<>();
            map.put("userId",map1.get("user_id"));
            map.put("productId",productId);
            map.put("quantity",quantity);
            int count = userService.insertShoppingList(map);
        }

        return "redirect:/user/shoppinglist";
    }

    @RequestMapping("/shoppinglist")
    public ModelAndView shoppinglist(){
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map = new HashMap<>();
        map.put("list",userService.selectListByUserId((Integer) map1.get("user_id")));
        int count = listCount();
        map.put("count",count);
        //判断是否登录
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("shoppinglist",map);
    }

    public int listCount(){
        HttpSession session = request.getSession();
        Map<String,Object> map = (Map<String, Object>) session.getAttribute("userMap");
        int count=0;
        if(map!=null){
            count = userService.shoppingListCount((Integer) map.get("user_id"));
        }
        return count;
    }
    @ResponseBody
    @RequestMapping("/setQuantity1")
    public String setQuantity1(@RequestParam("id") Integer shoppingListId){
        int result = userService.setQuantity1(shoppingListId);
        if(result == 1){
            return "{\"msg\":\"true\"}";
        }
        else{
            return "{\"msg\":\"false\"}";
        }
    }

    @ResponseBody
    @RequestMapping("/setQuantity2")
    public String setQuantity2(@RequestParam("id") Integer shoppingListId){
        int result = userService.setQuantity2(shoppingListId);
        if(result == 1){
            return "{\"msg\":\"true\"}";
        }
        else{
            return "{\"msg\":\"false\"}";
        }
    }

    @RequestMapping("/deleteshopping")
    public String deleteshopping(@RequestParam("shoppingListId") String shoppingListId){
        List<String> list=new ArrayList<String>();
        if(shoppingListId.indexOf(",")!=-1){//包含,多个删除
            list = getParamData(shoppingListId);
        }
        else{
            list.add(shoppingListId);
        }
        int count = userService.deleteShoppingList(list);
        return "redirect:/user/shoppinglist";
    }

    @RequestMapping("/confirmOrders")
    public ModelAndView confirmOrders(String shoppingListId){
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map2 = userService.findByName((String) map1.get("user_name"));
        Map<String,Object> map = new HashMap<String,Object>();
        List<Map<String,Object>> list = new ArrayList<>();
        List<String> list1= getParamData(shoppingListId);
        Double total = 0.0;
        for(int i=0;i<list1.size();i++){
            Integer id =Integer.parseInt(list1.get(i));
            Integer productId = userService.selectProductByShoppingListId(id);
            Integer quantity = userService.selectQuantityByShoppingListId(id);
            Map<String,Object> map3 = productService.selectProductById(productId);
            map3.put("quantity",quantity);
            Double totalPrice = quantity * (Double)map3.get("productNewPrice");
            map3.put("totalPrice",totalPrice);
            list.add(map3);
            total += totalPrice;
        }
        map.put("list",list);
        map.put("total",total);
        map.put("userName",map2.get("user_name"));
        map.put("userphone",map2.get("user_phone"));
        map.put("userAddress",map2.get("user_address"));
        map.put("shoppingListId",shoppingListId);
        map.put("index",2);
        int count = listCount();
        map.put("count",count);
        //判断是否登录
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        log.info("购物车购买信息---"+map);
        return new ModelAndView("pay",map);
    }

    @RequestMapping("/inserOrders")
    public String inserOrders(@RequestParam("shoppingListId") String shoppingListId,@RequestParam("text") String text){
        if(text.equals("")){
            text = "无";
        }
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        List<String> list= getParamData(shoppingListId);
        for(int i=0;i<list.size();i++){
            Integer id =Integer.parseInt(list.get(i));
            Integer productId = userService.selectProductByShoppingListId(id);
            Integer quantity = userService.selectQuantityByShoppingListId(id);
            Map<String,Object> map = new HashMap<>();
            map.put("userId",map1.get("user_id"));
            map.put("productId",productId);
            map.put("quantity",quantity);
            map.put("orderNote",text);
            int count =orderService.insertOrder(map);
        }
        userService.deleteShoppingList(list);
        return "redirect:/user/orderlist";
    }

    @RequestMapping("/orderlist")
    public ModelAndView orderlist(){
        int count = listCount();
        HttpSession session = request.getSession();
        Map<String,Object> map1 = (Map<String, Object>) session.getAttribute("userMap");
        Map<String,Object> map = new HashMap<>();
        map.put("list",orderService.selectAllOrdersByUserId((Integer) map1.get("user_id")));
        map.put("count",count);
        log.info("订单---"+map);
        //判断是否登录
        String userLogin = "";
        if(map1!=null){
            userLogin = (String) map1.get("user_name");
        }
        map.put("userLogin",userLogin);
        return new ModelAndView("orderlist",map);
    }
}

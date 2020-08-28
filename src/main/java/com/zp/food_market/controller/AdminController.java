package com.zp.food_market.controller;

import com.zp.food_market.service.impl.OrderServiceImpl;
import com.zp.food_market.service.impl.ProductServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController extends BaseController {
    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private OrderServiceImpl orderService;
    @Autowired
    private HttpServletRequest request;

    @GetMapping("/insertandupdate")
    public ModelAndView insertandupdate(){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("list",productService.selectCategory()) ;
        return new ModelAndView("insertandupdate",map);
    }

    @PostMapping("/insertupdate")
    public String insertupdate(@RequestParam("photoUrl") MultipartFile photoUrl,@RequestParam Map<String,Object> map) throws IOException {
        log.info("map---"+map);
        String charAndNumr = getCharAndNumr(20);
        map.put("photoNumber",charAndNumr);
        String newFileName = upload(photoUrl, request);
        log.info("文件名----"+newFileName);
        productService.insertUpdate(map);
        map.put("photoUrl",newFileName);
        map.put("photoRemark","index");
        productService.insertUpdatePhoto(map);
        return "redirect:/admin/adminindex";
    }
    @RequestMapping("/selectProductById")
    public ModelAndView selectProductById(@RequestParam("productId") Integer productId){
        Map<String,Object> map = productService.selectProductById(productId);
        map.put("list",productService.selectCategory()) ;
        return new ModelAndView("insertandupdate",map);
    }

    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam String ids){
//        List<String> list= new ArrayList<String>();
//        list.add("27");
//        list.add("28");
//        int count=iUserService.deleteUser(list);
        int count = productService.deleteProduct(getParamData(ids));
        return "redirect:/admin/adminindex";
    }

    //跳转到管理员主页
    @RequestMapping("/adminindex")
    public ModelAndView adminindex(@RequestParam Map<String,Object> map){
        //需要这里写一个方法，然后呢将我的map组合完毕
        //传递进来的map有两个必须要传的参数，第一个参数是pageIndex当前页,pageSize每页的最大条数
        //首先第一步拿到数量
        //int count=userService.selectUserManageCount(map);
        //这个时候的map就有分页的相关参数
        int count=productService.selectUserManageCount(map);
        Map<String,Object> paramMap=getPageParamMap(map,count);//组装分页
        log.info("商品paramMap"+paramMap);
        List<Map<String,Object>> list=productService.selectUserManageList(paramMap);
        paramMap.put("list",list);
        //--------------------------------------------------------
        // Map<String,Object> paramMap=getPageParamMap(map,userService.selectUserManageCount(map));
        // paramMap.put("list",userService.selectUserManageList(getPageParamMap(map,userService.selectUserManageCount(map))));
        return new ModelAndView("adminindex",paramMap);
    }

    //跳转到订单管理
    @RequestMapping("/adminorderlist")
    public ModelAndView adminorderlist(@RequestParam Map<String,Object> map){
        //需要这里写一个方法，然后呢将我的map组合完毕
        //传递进来的map有两个必须要传的参数，第一个参数是pageIndex当前页,pageSize每页的最大条数
        //首先第一步拿到数量
        //int count=userService.selectUserManageCount(map);
        //这个时候的map就有分页的相关参数
        int count=orderService.selectUserManageCount();
        Map<String,Object> paramMap=getPageParamMap(map,count);//组装分页
        log.info("订单paramMap---"+paramMap);
        List<Map<String,Object>> list=orderService.selectUserManageList(paramMap);
        paramMap.put("list",list);
        //--------------------------------------------------------
        // Map<String,Object> paramMap=getPageParamMap(map,userService.selectUserManageCount(map));
        // paramMap.put("list",userService.selectUserManageList(getPageParamMap(map,userService.selectUserManageCount(map))));
        return new ModelAndView("adminorderlist",paramMap);
    }

    @RequestMapping("/updateOrderStatus")
    public String updateOrderStatus(Integer orderId){
        int count = orderService.updateOrderStatus(orderId);
        return "redirect:/admin/adminorderlist";
    }

    @GetMapping("/deleteOrder")
    public String deleteOrder(@RequestParam String ids){
        int count = orderService.deleteorder(getParamData(ids));
        return "redirect:/admin/adminorderlist";
    }
}

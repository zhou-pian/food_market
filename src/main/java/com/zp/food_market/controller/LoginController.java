package com.zp.food_market.controller;

import com.zp.food_market.service.impl.AdminServiceImpl;
import com.zp.food_market.service.impl.ProductServiceImpl;
import com.zp.food_market.service.impl.UserServiceImpl;
import com.zp.food_market.utils.SendMessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userLogin")
@Slf4j
public class LoginController extends SendMessageUtil {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private AdminServiceImpl adminService;
    @Autowired
    private ProductServiceImpl productService;

    private String code = "";

    //跳转到登录页面
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    //跳转到登录页面
    @GetMapping("/test")
    public String test(@RequestParam("category")Integer categoryId,@RequestParam("storeName") String storeName){
        log.info(categoryId + "------" + storeName);
        return "login";
    }

    //跳转到用户注册页面
    @GetMapping("/register")
    public String register(){
        return "register";
    }

    //检查登录的用户名和密码是否正确
    @RequestMapping("/check")
    @ResponseBody
    public String check(String name,String passwd,Integer result){
        Map<String,Object> map = new HashMap<String, Object>();
        if(result== 1){//用户
            log.info("用户"+name);
            // 根据用户名和密码查询是否存在该用户
             map = userService.findByNameandPasswd(name,passwd);
        }
        else{//管理员
            log.info("管理员"+name);
            map = adminService.findByNameandPasswd(name,passwd);
        }

        if (map != null) {
            return "{\"msg\":\"true\"}";
        }
        return "{\"msg\":\"false\"}";
    }

    @RequestMapping("/login_success")
    public ModelAndView login_success(@RequestParam Map<String,Object> map){
        Integer result = Integer.parseInt((String) map.get("use"));
        ModelAndView mv = new ModelAndView();
        if(result == 1){
            Map<String,Object> map1 = userService.findByName((String) map.get("user"));
            HttpSession session = request.getSession(); // 得到公共session会话记录用户信息
            session.setAttribute("userMap", map1);
            mv.setViewName("redirect:/user/index");
        }
        else{
            mv.setViewName("redirect:/admin/adminindex");
        }
        return  mv;
    }

    //发送手机验证码
    @ResponseBody
    @PostMapping("/sendCode")
    public String sendCode(@RequestParam("phone") String phone){
        log.info("phone----"+phone);
        code = getRandomCode(6);
        log.info("send---"+code);
        //SendMessageUtil.send("SMS账户","接口秘钥","目标号码","发送内容");
        //Integer resultCode = SendMessageUtil.send("dspshuheb","d41d8cd98f00b204e980",phone,"【shopCZ商城】验证码:"+code+",请勿泄露");
        Integer resultCode = SendMessageUtil.send("abhufkjkunhj","d41d8cd98f00b204e980",phone,"【shopCZ商城】验证码:"+code+",请勿泄露");
        if(resultCode>0){
            return "{\"msg\":\"成功\"}";
        }
        else if(resultCode == -4){
            return "{\"msg\":\"手机号格式不正确!\"}";
        }
        else{
            return "{\"msg\":\"发送失败！\"}";
        }
    }

    //检查用户注册时两次密码是否一致 和验证码是否正确
    @ResponseBody
    @RequestMapping("/checkPassword")
    public String checkPassword(@RequestParam Map<String,Object> map){
        log.info("验证map"+map);
        if(map.get("agreement").equals("false")){
            return "{\"msg\":\"请勾选协议！\"}";
        }
        else if(map.get("userName").equals("")){
            return "{\"msg\":\"请填写用户名！\"}";
        }
        else if(map.get("password").equals("")){
            return "{\"msg\":\"请填写密码！\"}";
        }
        else if(map.get("passwordRepeat").equals("")){
            return "{\"msg\":\"请填写确认密码！\"}";
        }
        else if(map.get("code").equals("")){
            return "{\"msg\":\"请填写验证码！\"}";
        }
        else if(userService.findByName((String)map.get("userName")) != null){
            return "{\"msg\":\"该用户名已被注册！\"}";
        }
        else if(!map.get("code").equals(code)){
            return "{\"msg\":\"验证码错误！\"}";
        }
        else if(!map.get("password").equals(map.get("passwordRepeat"))){
            return "{\"msg\":\"两次填写的密码不一致！\"}";
        }else{
            return "{\"msg\":\"注册成功\"}";
        }
    }

    //注册成功，插入一个新用户
    @PostMapping("/insertUser")
    public String insertUser(@RequestParam Map<String,Object> map){
        log.info("注册"+map);
        userService.insertUser(map);
        return "redirect:/userLogin/login";
    }

    @RequestMapping("/forgetpasswd")
    public ModelAndView frogetpasswd(@RequestParam String userName){
        Map<String,Object> map = userService.findByName(userName);
        log.info("forgetpasswd----"+map);
        return new ModelAndView("forgetpasswd",map);
    }

    @ResponseBody
    @RequestMapping("/CheckPassword1")
    public String CheckPassword1(@RequestParam Map<String,Object> map){
        log.info(code);
        log.info("check--"+map);
         if(map.get("password").equals("")){
            return "{\"msg\":\"请填写密码！\"}";
        }
        else if(map.get("passwordRepeat").equals("")){
            return "{\"msg\":\"请填写确认密码！\"}";
        }
        else if(map.get("code").equals("")){
            return "{\"msg\":\"请填写验证码！\"}";
        }
         else if(!map.get("password").equals(map.get("passwordRepeat"))){
             return "{\"msg\":\"两次填写的密码不一致！\"}";
         }
         else if(map.get("password").equals(map.get("userPassword"))){
             return "{\"msg\":\"新密码不能与旧密码相同！\"}";
         }
        else if(!map.get("code").equals(code)){
            return "{\"msg\":\"验证码错误！\"}";
        }
        else{
            return "{\"msg\":\"修改密码成功\"}";
        }
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(@RequestParam Map<String,Object> map){
        userService.updatePasswd(map);
        return "redirect:/userLogin/login";
    }
}

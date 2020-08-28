package com.zp.food_market.controller;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class BaseController {
    //29,28
    public List<String> getParamData(String ids){
        List<String> list=new ArrayList<String>();
        StringBuffer buff=new StringBuffer(ids);
        String s[]=buff.toString().split(",");
        for (int i=0;i<s.length;i++){
            list.add(s[i]);
        }
        return list;
    }

    public String upload(@RequestParam("photoUrl") MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = "/img/" + UUID.randomUUID().toString() + suffixName;
        // String filePath = ClassUtils.getDefaultClassLoader().getResource("static").getPath() + newFileName;
        String filePath = "e:\\" + newFileName;
        FileOutputStream out = new FileOutputStream(filePath);
        //log.info(filePath);
        InputStream in = file.getInputStream();
        IOUtils.copy(in, out);
        return newFileName;//控制器Controller selectUserList把刚才上传数据的表显示出来 redirect:\selectUserList
    }

    //分页的方法
    //最后将所有的东西放到map里面去，然后带入到sql语句，进行相关的条件和对应的分页处理
    //传递进来的map有两个参数第一个是pageIndex,第二个是pageSize
    public Map<String,Object> getPageParamMap(Map<String,Object> map,int totalCount){
        //这个时候记住，你的map如果是分页那么一定能拿到分页的基本参数(但是有可能map还带有查询条件呢)
        if(map.get("pageIndex")==null||map.get("pageSize")==null){
            int pageIndex = 1;
            int pageSize = 10;
            int totalPage = totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
            //得到索引号
            int start=(pageIndex-1)*pageSize;
            map.put("pageIndex",pageIndex);
            map.put("pageSize",pageSize);
            map.put("totalPage",totalPage);
            map.put("totalCount",totalCount);
            map.put("start",start);

        }else{
            //否则这里一定是分页的
            //总的数量
            //拿到我的当前页数
            int pageIndex=Integer.parseInt(map.get("pageIndex").toString());
            //拿到每页的最大条数
            int pageSize=Integer.parseInt(map.get("pageSize").toString());
            //得到总的页数
            int totalPage=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
            //得到索引号
            int start=(pageIndex-1)*pageSize;
            map.put("pageIndex",pageIndex);
            map.put("pageSize",pageSize);
            map.put("totalCount",totalCount);
            map.put("totalPage",totalPage);
            map.put("start",start);
        }
        return map;
    }

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

}

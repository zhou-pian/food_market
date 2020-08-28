<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>购物车页面</title>
    <link rel="stylesheet" href="../static/css/base.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_gouwuche.css" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery.js" ></script>
    <script type="text/javascript" src="../static/js/topNav.js" ></script>
    <script type="text/javascript" src="../static/js/jquery.goodnums.js" ></script>
    <script type="text/javascript" src="../static/js/shop_gouwuche.js" ></script>
    <script type="text/javascript">
            //全选和非全选的功能
            function chooseAll(){
                //取到checkbox的所有元素节点
                var box=document.getElementsByName("ids");
                if(box[0].checked){//状态
                    for(var i=0;i<box.length;i++){
                        box[i].checked=true;
                    }
                    document.getElementById("btn").disabled="";//开启删除按钮
                }else{
                    for(var i=0;i<box.length;i++){
                        box[i].checked=false;
                    }
                    document.getElementById("btn").disabled="disabled";//禁用删除按钮
                }

            }

            //监听里面的每一个选项
            function chooseOne() {
                //判断点击的这个checkbox选项到底的是选中还是没有选中(不是这一个按钮，我的意思是判断循环里面的checkbox是否都全部选中或者非选中)
                var box = document.getElementsByName("ids");
                var result = false;
                for (var i = 1; i < box.length; i++) {
                    if (box[i].checked == false) {//只要有一个为空
                        result = true;//绝对不是全部选中状态
                        break;
                    }
                }
                if (result) {//不是全选的状态那么checkbox[0]肯定不能选中
                    box[0].checked = false;
                    document.getElementById("btn").disabled = "disabled";//禁用删除按钮
                } else {
                    box[0].checked = true;
                    document.getElementById("btn").disabled = "";//开启删除按钮
                }
                //这里需要开始进行删除的按钮的显示或者禁用
                //开启的前提是只要有一个选中了那么我就开启是删除的按钮

                var temp=false;
                for(var i=1;i<box.length;i++){
                    if(box[i].checked){
                        temp=true;
                        break;
                    }
                }
                if(temp){
                    document.getElementById("btn").disabled="";
                }else{
                    document.getElementById("btn").disabled="disabled";
                }
            }


            function delete_btn() {
                var box=document.getElementsByName("ids");
                var ids="";
                for(var i=1;i<box.length;i++){
                    if(box[i].checked){
                        ids+=box[i].value+",";
                    }
                }
                //去除id多余的,
                ids = ids.substring(0, ids.length-1);
                if(confirm('您确定要删除数据吗?')){
                    // alert('执行删除');
                    location.href='/user/deleteshopping?shoppingListId='+ids;
                }else{
                    alert('您取消了删除的操作!');
                }
            }

            function confirmOrder(){
                var box=document.getElementsByName("ids");
                var ids="";
                for(var i=1;i<box.length;i++){
                    if(box[i].checked){
                        ids+=box[i].value+",";
                    }
                }
                if(ids == ""){
                    alert("您还未选择商品哦~")
                }else{
                    //去除id多余的,
                    ids = ids.substring(0, ids.length-1);
                    if(confirm('您确定要购买吗?')){
                        // alert('执行删除');
                        location.href='/user/confirmOrders?shoppingListId='+ids;
                    }else{
                        alert('您取消了删除的操作!');
                    }
                }

            }

            window.onload=function () {
            var danjia=document.getElementsByName("price");//单价
            var jian=document.getElementsByName("minus");//-
            var add=document.getElementsByName("amount");//数量
            var jia=document.getElementsByName("plus");//+
            var xiaoji=document.getElementsByName("xiaoji");

            //--单击事件
            for(var i=0;i<jian.length;i++){
                jian[i].index=i;
                jian[i].onclick=function() {
                    if(add[this.index].value>1){
                        add[this.index].value--;
                        var price=danjia[this.index].innerHTML;
                        var count=add[this.index].value;
                        var total=parseFloat(price*count);
                        xiaoji[this.index].innerHTML=total.toFixed(1);
                        var id = $(this).parents("tr").find("td:eq(1)").text();
                        $.ajax({
                            url:"/user/setQuantity2",
                            type:"post",
                            data:{"id":id},
                            dataType:"json",
                            async:false, // 让ajax执行代码顺序同步
                            success: function (data) {
                                console.log(data);
                            }
                        });
                    }
                }
            }
            //++单击事件
            for(var i=0;i<jia.length;i++){//数量无上限
                jia[i].index=i;
                jia[i].onclick=function() {
                    add[this.index].value++;
                    var price=danjia[this.index].innerHTML;
                    var count=add[this.index].value;
                    var total=parseFloat(price*count);
                    xiaoji[this.index].innerHTML=total.toFixed(1);

                    var id = $(this).parents("tr").find("td:eq(1)").text();
                    $.ajax({
                        url:"/user/setQuantity1",
                        type:"post",
                        data:{"id":id},
                        dataType:"json",
                        async:false, // 让ajax执行代码顺序同步
                        success: function (data) {
                            console.log(data);
                        }
                    });
                }
            }
        }

    </script>
</head>
<body>
<!-- Header  -wll-2013/03/24 -->
<div class="shop_hd">
    <!-- Header TopNav -->
    <div class="shop_hd_topNav">
        <div class="shop_hd_topNav_all">
            <!-- Header TopNav Left -->
            <div class="shop_hd_topNav_all_left">
                <p>您好，欢迎来到<b><a href="/">ShoopNC商城</a></b>
                    [<#if userLogin==""><a href="/userLogin/login">登录</a></#if>
                    <#if userLogin!=""><a href="/userLogin/login">退出登录</a></#if>]
                    [<a href="/userLogin/register">注册</a>]</p>
            </div>
            <!-- Header TopNav Left End -->

            <!-- Header TopNav Right -->
            <div class="shop_hd_topNav_all_right">
                <ul class="topNav_quick_menu">
                    <li>
                        <div class="topNav_menu">
                            <a href="/user/index">商城首页</a>
                        </div>
                    </li>

                    <li>
                        <div class="topNav_menu">
                            <a href="#" class="topNavHover">我的商城<i></i></a>
                            <div class="topNav_menu_bd" style="display:none;" >
                                <ul>
                                    <li><a title="已买到的商品" target="_top" href = "/user/orderlist">已买到的商品</a></li>
                                    <li><a title="个人主页" target="_top" href="#">个人主页</a></li>
                                    <li><a title="我的好友" target="_top" href="#">我的好友</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="topNav_menu">
                            <a href = "/user/shoppinglist">购物车<b>${count}</b>种商品</a>
                        </div>
                    </li>

                    <li>
                        <div class="topNav_menu">
                            <a href="#" class="topNavHover">我的收藏<i></i></a>
                            <div class="topNav_menu_bd" style="display:none;">
                                <ul>
                                    <li><a title="收藏的商品" target="_top" href="#">收藏的商品</a></li>
                                    <li><a title="收藏的店铺" target="_top" href="#">收藏的店铺</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="topNav_menu">
                            <a href="#">站内消息</a>
                        </div>
                    </li>

                </ul>
            </div>
            <!-- Header TopNav Right End -->
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <!-- Header TopNav End -->

    <!-- TopHeader Center -->
    <div class="shop_hd_header">
        <div class="shop_hd_header_logo"><h1 class="logo"><a href="/"><img src="../static/images/logo.png" alt="ShopCZ" /></a><span>ShopCZ</span></h1></div>
        <div class="shop_hd_header_search">
            <ul class="shop_hd_header_search_tab">
                <li id="search" class="current">商品</li>
                <li id="shop_search">店铺</li>
            </ul>
            <div class="clear"></div>
            <div class="search_form">
                <form method="post" action="/user/search">
                    <div class="search_formstyle">
                        <input type="text" class="search_form_text" name="search_content" placeholder="搜索其实很简单！" />
                        <input type="submit" class="search_form_sub" name="secrch_submit" value="" title="搜索" />
                    </div>
                </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <!-- TopHeader Center End -->

    <!-- Header Menu -->
    <div class="shop_hd_menu">
        <!-- 所有商品菜单 -->

        <div id="shop_hd_menu_all_category" class="shop_hd_menu_all_category"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
            <div class="shop_hd_menu_all_category_title"><h2 title="所有商品"><a href="javascript:void(0);">所有商品</a></h2><i></i></div>
            <div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
                <ul class="shop_hd_menu_all_category_hd_menu clearfix">
                    <!-- 单个菜单项 -->
                    <li id="cat_1" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=1" title="饮品">饮品</a></h3>
                    </li>
                    <!-- 单个菜单项 End -->
                    <li id="cat_2" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=2" title="坚果">坚果</a></h3>
                    </li>

                    <li id="cat_3" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=3" title="肉类">肉类</a></h3>
                    </li>
                    <li id="cat_4" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=4" title="糖果">糖果</a></h3>
                    </li>

                    <li id="cat_5" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=5" title="饼干">饼干</a></h3>
                    </li>

                    <li id="cat_6" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=6" title="薯片">薯片</a></h3>
                    </li>
                    <li id="cat_7" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=7" title="巧克力">巧克力</a></h3>
                    </li>
                    <li id="cat_8" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=8" title="蛋糕">蛋糕</a></h3>
                    </li>
                    <li id="cat_9" class="">
                        <h3><a href="/user/selectByCategoryId?categoryId=9" title="其他">其他</a></h3>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 所有商品菜单 END -->

        <!-- 普通导航菜单 -->
        <ul class="shop_hd_menu_nav">
            <li class="current_link"><a href="#"><span>首页</span></a></li>
            <li class="link"><a href="#"><span>团购</span></a></li>
            <li class="link"><a href="#"><span>品牌</span></a></li>
            <li class="link"><a href="#"><span>优惠卷</span></a></li>
            <li class="link"><a href="#"><span>积分中心</span></a></li>
            <li class="link"><a href="#"><span>运动专场</span></a></li>
            <li class="link"><a href="#"><span>微商城</span></a></li>
        </ul>
        <!-- 普通导航菜单 End -->
    </div>
    <!-- Header Menu End -->



</div>
<div class="clear"></div>
<!-- 面包屑 注意首页没有 -->
<div class="shop_hd_breadcrumb">
    <strong>当前位置：</strong>
    <span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">我的商城</a>&nbsp;›&nbsp;
			<a href="">我的购物车</a>
		</span>
</div>
<div class="clear"></div>
<!-- 面包屑 End -->
</div>
<div class="clear"></div>
<!-- Header End -->

<!-- 购物车 Body -->
<div class="shop_gwc_bd clearfix">
    <!-- 在具体实现的时候，根据情况选择其中一种情况 -->
    <#if list?? && (list?size > 0) >

    <!-- 购物车有商品 -->
    <div class="shop_gwc_bd_contents clearfix">
        <!-- 购物流程导航 -->
        <div class="shop_gwc_bd_contents_lc clearfix">
            <ul>
                <li class="step_a hover_a">确认购物清单</li>
                <li class="step_b">确认收货人资料及送货方式</li>
                <li class="step_c">购买完成</li>
            </ul>
        </div>
        <!-- 购物流程导航 End -->

        <!-- 购物车列表 -->
        <table>
            <thead>
            <tr>
                <th><input type="checkbox" name="ids" onclick="chooseAll();"></th>
                <th style="display: none">#</th>
                <th>序号</th>
                <th colspan="2"><span>商品</span></th>
                <th><span>单价(元)</span></th>
                <th><span>数量</span></th>
                <th><span>小计</span></th>
                <th><span>操作<button type="button" id="btn" style="background-color: #d9544f;color:white;border: none;border-radius: 5px;" onclick="delete_btn()" disabled="disabled">删除</button></span></th>
            </tr>
            </thead>
            <tbody>
            <#list list as item>
            <tr>
                <td><input type="checkbox" name="ids" value="${item.shoppingListId}" onclick="chooseOne();"></td>
                <td style="display: none">${item.shoppingListId}</td>
                <td class="gwc_list_danjia">${item_index+1}</td>
                <td class="gwc_list_pic"><a href=""><img src="${item.photoUrl}" style="width: 60px;height: 60px"/></a></td>
                <td class="gwc_list_title"><a href="">${item.productTitle} </a></td>
                <td class="gwc_list_danjia"><span>￥<strong id="price" name="price">${item.productNewPrice}</strong></span></td>
                <td class="gwc_list_shuliang"><span><input type="button" name="minus" value="-">
                    <input type="text" readonly="readonly" name="amount" value="${item.quantity}">
                    <input type="button" name="plus" value="+"></span></td>
                <td class="gwc_list_xiaoji"><span>￥<strong id="xiaoji" name="xiaoji" class="good_xiaojis">${item.total}</strong></span></td>
                <td><a href="/user/deleteshopping?shoppingListId=${item.shoppingListId}" class="shop_good_delete">删除</a></td>
            </tr>
            </#list>

            </tbody>
            <tfoot>
            <tr>
                <td colspan="8">
                    <div class="clear"></div>
                    <div class="gwc_foot_links">
                        <a href="/user/index" class="go">继续购物</a>
                        <a href = "javascript:void(0);" onclick="confirmOrder()" class="op">确认并填写订单</a>
                    </div>
                </td>
            </tr>
            </tfoot>
        </table>
        <!-- 购物车列表 End -->
        <#else>
            <!-- 购物车为空 -->
            <div class="empty_cart mb10">
                <div class="message">
                    <p>购物车内暂时没有商品，您可以<a href="/user/index">去首页</a>挑选喜欢的商品</p>
                </div>
            </div>
            <!-- 购物车为空 end-->
        </#if>
    </div>
    <!-- 购物车有商品 end -->

</div>
<!-- 购物车 Body End -->

<!-- Footer - wll - 2013/3/24 -->
<div class="clear"></div>
<div class="shop_footer">
    <div class="shop_footer_link">
        <p>
            <a href="">首页</a>|
            <a href="">招聘英才</a>|
            <a href="">广告合作</a>|
            <a href="">关于ShopCZ</a>|
            <a href="">关于我们</a>
        </p>
    </div>
    <div class="shop_footer_copy">
        <p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
    </div>
</div>
<!-- Footer End -->

</body>
</html>
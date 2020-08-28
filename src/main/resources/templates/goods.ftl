<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>商品详细页面</title>
    <link rel="stylesheet" href="../static/css/base.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_list.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_goods.css" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery.js" ></script>
    <script type="text/javascript" src="../static/js/topNav.js" ></script>
    <script type="text/javascript" src="../static/js/shop_goods.js" ></script>

    <script type="text/javascript">
        function CheckLogin() {
            $.ajax({
                url:"/user/checkLogin",
                type:"post",
                dataType:"json",
                async:false, // 让ajax执行代码顺序同步
                success: function (data) {
                    if (data.msg == "false") {
                        alert("您还未登录哦~ 请先登录");
                        location.href='/userLogin/login';
                    }
                    else {
                        location.href='/user/shoppinglist';
                    }
                }
            });
        }
        function CheckLogin1() {
            $.ajax({
                url:"/user/checkLogin",
                type:"post",
                dataType:"json",
                async:false, // 让ajax执行代码顺序同步
                success: function (data) {
                    if (data.msg == "false") {
                        alert("您还未登录哦~ 请先登录");
                        location.href='/userLogin/login';
                    }
                    else {
                        location.href='/user/orderlist';
                    }
                }
            });
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
                                    <li><a title="已买到的商品" target="_top" href = "javascript:void(0);" onclick="CheckLogin1()">已买到的商品</a></li>
                                    <li><a title="个人主页" target="_top" href="#">个人主页</a></li>
                                    <li><a title="我的好友" target="_top" href="#">我的好友</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="topNav_menu">
                            <a href = "javascript:void(0);" onclick="CheckLogin()">购物车<b>${count}</b>种商品</a>
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
<!-- Header End -->

<!-- Goods Body -->
<div class="shop_goods_bd clear">

    <!-- 商品展示 -->
    <div class="shop_goods_show">
        <div class="shop_goods_show_left">
            <!-- 京东商品展示 -->
            <link rel="stylesheet" href="../static/css/shop_goodPic.css" type="text/css" />
            <script type="text/javascript" src="../static/js/shop_goodPic_base.js"></script>
            <script type="text/javascript" src="../static/js/lib.js"></script>
            <script type="text/javascript" src="../static/js/163css.js"></script>
            <div id="preview">
                <div class=jqzoom id="spec-n1" onClick="window.open('/')"><img height="350" src="${photoUrl}" jqimg="${photoUrl}" width="350">
                </div>
                <div id="spec-n5">
                    <div class=control id="spec-left">
                        <img src="../static/images/left.gif" />
                    </div>
                    <div id="spec-list">
                        <ul class="list-h">
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                            <li><img src="${photoUrl}"> </li>
                        </ul>
                    </div>
                    <div class=control id="spec-right">
                        <img src="../static/images/right.gif" />
                    </div>

                </div>
            </div>

            <script type="text/javascript">
                $(function(){
                    $(".jqzoom").jqueryzoom({
                        xzoom:400,
                        yzoom:400,
                        offset:10,
                        position:"right",
                        preload:1,
                        lens:1
                    });
                    $("#spec-list").jdMarquee({
                        deriction:"left",
                        width:350,
                        height:56,
                        step:2,
                        speed:4,
                        delay:10,
                        control:true,
                        _front:"#spec-right",
                        _back:"#spec-left"
                    });
                    $("#spec-list img").bind("mouseover",function(){
                        var src=$(this).attr("src");
                        $("#spec-n1 img").eq(0).attr({
                            src:src.replace("\/n5\/","\/n1\/"),
                            jqimg:src.replace("\/n5\/","\/n0\/")
                        });
                        $(this).css({
                            "border":"2px solid #ff6600",
                            "padding":"1px"
                        });
                    }).bind("mouseout",function(){
                        $(this).css({
                            "border":"1px solid #ccc",
                            "padding":"2px"
                        });
                    });

                })

                function jia() {
                    var count = document.getElementById("good_count");
                    var price = document.getElementById("price");
                    count.innerHTML = (Number(count.innerHTML) + Number(price.innerHTML)).toFixed(1);
                }
                function jian() {
                    var count = document.getElementById("good_count");
                    var price = document.getElementById("price");
                    if(document.getElementById("good_nums").value > 1){
                        count.innerHTML = (Number(count.innerHTML) - Number(price.innerHTML)).toFixed(1);
                    }
                }
                function Check() {
                    var productId = document.getElementById("productId").value.trim();
                    var quantity = document.getElementById("good_nums").value.trim();
                    $.ajax({
                        url:"/user/checkLogin",
                        type:"post",
                        dataType:"json",
                        async:false, // 让ajax执行代码顺序同步
                        success: function (data) {
                            if (data.msg == "false") {
                                alert("您还未登录哦~ 请先登录");
                                location.href='/userLogin/login';
                            }
                            else {
                                location.href='/user/confirmOrder?productId='+productId+'&quantity='+quantity;
                            }
                        }
                    });
                }
                function Check1() {
                    var productId = document.getElementById("productId").value.trim();
                    var quantity = document.getElementById("good_nums").value.trim();
                    $.ajax({
                        url:"/user/checkLogin",
                        type:"post",
                        dataType:"json",
                        async:false, // 让ajax执行代码顺序同步
                        success: function (data) {
                            if (data.msg == "false") {
                                alert("您还未登录哦~ 请先登录");
                                location.href='/userLogin/login';
                            }
                            else {
                                location.href='/user/insertShoppingList?productId='+productId+'&quantity='+quantity;
                            }
                        }
                    });
                }
            </script>
            <!-- 京东商品展示 End -->

        </div>
        <div class="shop_goods_show_right">
            <input type="hidden" name="productId" id="productId" value="${productId}">
            <ul>
                <li>
                    <strong style="font-size:14px; font-weight:bold;">${productTitle}</strong>
                </li>
                <li>
                    <label>商城价：</label>
                    <span><strong id="price">${productNewPrice}</strong>元</span>
                </li>
                <#if productNewPrice!=productOldPrice>
                <li>
                    <label>原价：</label>
                    <span style="text-decoration:line-through">${productOldPrice}元</span>
                </li>
                </#if>
                <li>
                    <label>运费：</label>
                    <span>卖家承担运费</span>
                </li>
                <li>
                    <label>月销量：</label>
                    <span>${productSellMonthCount}件</span>
                </li>
                <li>
                    <label>总销量：</label>
                    <span>${productSellTotalCount}件</span>
                </li>
                <li class="goods_num">
                    <label>购买数量：</label>
                    <span><a class="good_num_jian" id="good_num_jian" onclick="jian()"></a><input type="text" readonly="readonly" value="1" id="good_nums" class="good_nums" /><a onclick="jia()" id="good_num_jia" class="good_num_jia"></a>(当前库存${productTotalCount}件)</span>
                </li>
                <li class="goods_num">
                    <label>商品总价：</label>
                    <span style="color: red;font-size: large">&yen;</span><span id="good_count" style="color: red;font-size: large;font-weight: bold">${productNewPrice}</span>
                </li>
                <li style="padding:20px 0;">
                    <label>&nbsp;</label>
                    <span><button style="background-color: #ffeded;color: red;border: red;width: 130px;height: 35px;margin-right: 20px" onclick="Check()">立即购买</button></span>
                    <span><button style="background-color: #f03726;color: white;border: none;width: 130px;height: 35px" onclick="Check1()">加入购物车</button></span>
                </li>
            </ul>
        </div>
    </div>
    <!-- 商品展示 End -->

    <div class="clear mt15"></div>
    <!-- Goods Left -->
    <div class="shop_bd_list_left clearfix">
        <!-- 左边商品分类 -->
        <div class="shop_bd_list_bk clearfix">
            <div class="title">商品分类</div>
            <div class="contents clearfix">
                <dl class="shop_bd_list_type_links clearfix">
                    <dd>
                        <span><a href="/user/selectByCategoryId?categoryId=1" title="饮品">饮品</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=2" title="坚果">坚果</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=3" title="肉类">肉类</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=4" title="糖果">糖果</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=5" title="饼干">饼干</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=6" title="薯片">薯片</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=7" title="巧克力">巧克力</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=8" title="蛋糕">蛋糕</a></span>
                        <span><a href="/user/selectByCategoryId?categoryId=9" title="其他">其他</a></span>
                    </dd>
                </dl>
            </div>
        </div>
        <!-- 左边商品分类 End -->


    </div>
    <!-- Goods Left End -->

    <!-- 商品详情 -->
    <script type="text/javascript" src="../static/js/shop_goods_tab.js"></script>
    <div class="shop_goods_bd_xiangqing clearfix">
        <div class="shop_goods_bd_xiangqing_tab">
            <ul>
                <li id="xiangqing_tab_1" onmouseover="shop_goods_easytabs('1', '1');" onfocus="shop_goods_easytabs('1', '1');" onclick="return false;"><a href=""><span>商品详情</span></a></li>
                <li id="xiangqing_tab_2" onmouseover="shop_goods_easytabs('1', '2');" onfocus="shop_goods_easytabs('1', '2');" onclick="return false;"><a href=""><span>商品评论</span></a></li>
                <li id="xiangqing_tab_3" onmouseover="shop_goods_easytabs('1', '3');" onfocus="shop_goods_easytabs('1', '3');" onclick="return false;"><a href=""><span>商品咨询</span></a></li>
            </ul>
        </div>
        <style type="text/css">
            .comment_list{width: 100%;height: auto;clear: both;margin-bottom: 20px;float: left;border-bottom: 1px dotted #cccccc;padding-bottom: 10px;}
            .comment_list .avatar{width: 50px;height: auto;margin-right: 10px;float: left;}
            .comment_list .avatar img{width: 50px;height: 50px;overflow: hidden;}
            .comment_list .avatar span{height: 24px;line-height: 24px;display: inline-block;}
            .comment_list_content{width: 700px;height: auto;float: right;}
            .comment_list_content .comment_list_content_l{width: 500px;float: left;}
            .comment_list_content_l p.tit{width: 100%;height: 24px;line-height: 24px;}
            .comment_list_content_l p.tit span{margin-right: 10px;}
            .comment_list_content_l .star i{width: 13px;height: 13px;display: inline-block;background: url(../static/images/star0.jpg);}
            .comment_list_content_l .star i.cur{background: url(../static/images/star1.jpg);}
            .comment_list_content_l p.con{line-height: 150%;}
            .comment_list_content .comment_list_content_r{width: 200px;float: right;text-align: right;}
            .comment_list_content_r a{height: 24px;line-height: 24px;padding: 0 8px;display: inline-block;border: 1px solid #dfdfdf;border-radius: 3px;margin-top: 30px;color: #333333;}
            .comment_list_content_r a:hover{color: #cc0000;text-decoration: none;}
            .comment_list_content_r a i{font-style: normal;padding: 0 5px;color: #cc0000;font-weight: bold;}
        </style>
        <div class="shop_goods_bd_xiangqing_content clearfix">
            <div id="xiangqing_content_1" class="xiangqing_contents clearfix">
                <p>商品详情----11111</p>
            </div>
            <div id="xiangqing_content_2" class="xiangqing_contents clearfix">
                <!--一条评论 开始-->
                <div class="comment_list">
                    <div class="avatar">
                        <img src="../static/images/user.gif">
                        <span>zhang***</span>
                    </div>
                    <div class="comment_list_content">
                        <div class="comment_list_content_l">
                            <p class="tit">
                                <span class="time">2015-07-24</span>
                                <span class="star">
										<i class="cur"></i>
										<i></i>
										<i></i>
										<i></i>
										<i></i>
									</span>
                            </p>
                            <p class="con">
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                            </p>
                        </div>
                        <div class="comment_list_content_r">
                            <a href="javascript:">有用 (<i>1</i>)</a>
                            <a href="javascript:">没用 (<i>2</i>)</a>
                        </div>
                    </div>
                </div>
                <!--一条评论 结束-->

                <!--一条评论 开始-->
                <div class="comment_list">
                    <div class="avatar">
                        <img src="../static/images/user.gif">
                        <span>zhang***</span>
                    </div>
                    <div class="comment_list_content">
                        <div class="comment_list_content_l">
                            <p class="tit">
                                <span class="time">2015-07-24</span>
                                <span class="star">
										<i class="cur"></i>
										<i></i>
										<i></i>
										<i></i>
										<i></i>
									</span>
                            </p>
                            <p class="con">
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                                裤子很漂亮，质量也很好，穿着很合身，性价比很高的意见宝贝。值得购买，发货速度很快
                            </p>
                        </div>
                        <div class="comment_list_content_r">
                            <a href="javascript:">有用 (<i>1</i>)</a>
                            <a href="javascript:">没用 (<i>2</i>)</a>
                        </div>
                    </div>
                </div>
                <!--一条评论 结束-->


            </div>

            <div id="xiangqing_content_3" class="xiangqing_contents clearfix">
                <p>商品自诩---3333</p>
            </div>
        </div>
    </div>
    <!-- 商品详情 End -->

</div>
<!-- Goods Body End -->

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
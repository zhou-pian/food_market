<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="../static/css/base.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="../static/css/shop_manager.css" type="text/css" />
    <script type="text/javascript" src="../static/js/jquery.js" ></script>
    <script type="text/javascript" src="../static/js/topNav.js" ></script>
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
                    [<#if userLogin ==""><a href="/userLogin/login">登录</a></#if>
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
			<a href="">已买到商品</a>
		</span>
</div>
<div class="clear"></div>
<!-- 面包屑 End -->

<!-- Header End -->

<!-- 我的个人中心 -->
<div class="shop_member_bd clearfix">
    <!-- 左边导航 -->
    <div class="shop_member_bd_left clearfix">

        <div class="shop_member_bd_left_pic">
            <a href="javascript:void(0);"><img src="../static/images/avatar.png" /></a>
        </div>
        <div class="clear"></div>

        <dl>
            <dt>我的交易</dt>
            <dd><span><a href="">已购买商品</a></span></dd>
            <dd><span><a href="">我的收藏</a></span></dd>
            <dd><span><a href="">评价管理</a></span></dd>
        </dl>

        <dl>
            <dt>我的账户</dt>
            <dd><span><a href="">个人资料</a></span></dd>
            <dd><span><a href="">密码修改</a></span></dd>
            <dd><span><a href="">收货地址</a></span></dd>
        </dl>

    </div>
    <!-- 左边导航 End -->

    <!-- 右边购物列表 -->
    <div class="shop_member_bd_right clearfix">

        <div class="shop_meber_bd_good_lists clearfix">
            <#if list?? && (list?size > 0)>
            <div class="title"><h3>订单列表</h3></div>
            <table>
                <thead class="tab_title">
                <th style="width:400px;"><span>商品信息</span></th>
                <th style="width:80px;"><span>单价</span></th>
                <th style="width:50px;"><span>数量</span></th>
                <th style="width:80px;"><span>订单总价</span></th>
                <th style="width:105px;"><span>状态与操作</span></th>
                <th style="width:130px;"><span>留言</span></th>

                </thead>
                <tbody>

                <#list list as item>

                <tr><td colspan="6">
                        <table class="good">
                            <thead >
                            <tr><th colspan="2" style="width: 350px">
                                    <span><strong>订单号码：</strong>${item.orderId}</span>
                                </th>
                                <th colspan="5">
                                    <span><strong>订单创建时间：</strong>${item.orderRegTime}</span>
                                </th></tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="dingdan_pic"><a href="/user/goods?productId=${item.productId}"><img src="${item.photoUrl}" /></a></td>
                                <td class="dingdan_title"><span><a href="/user/goods?productId=${item.productId}">${item.productTitle}</a></span>
                                <td class="dingdan_danjia" style="width:80px;">￥<strong>${item.productNewPrice}</strong></td>
                                <td class="dingdan_shuliang" style="width:50px;">${item.quantity}</td>
                                <td class="dingdan_zongjia" style="width:80px;">￥<strong>${item.totalPrice}</strong><br />(免运费)</td>
                                <td class="dingdan_shuliang" style="width:105px;">${item.orderStatus}</td>
                                <td class="dingdan_shuliang" style="width:130px;">${item.orderNote}</td>
                            </tr>
                            </tbody>
                        </table>
                    </td></tr>
                    </#list>
                </tbody>
            </table>
                <#else>
                    <div style="font-size:large; margin-top: 40px; color: firebrick">暂无订单 //(ㄒoㄒ)//  您可以<a href="/user/index">去首页</a>挑选喜欢的商品</div>
            </#if>
        </div>
    </div>
    <!-- 右边购物列表 End -->

</div>
<!-- 我的个人中心 End -->

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
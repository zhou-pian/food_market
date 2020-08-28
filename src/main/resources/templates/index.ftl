<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>ShopCZ-首页</title>
	<link rel="stylesheet" href="../static/css/base.css" type="text/css" />
	<link rel="stylesheet" href="../static/css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="../static/css/shop_header.css" type="text/css" />
	<link rel="stylesheet" href="../static/css/shop_home.css" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery.js" ></script>
	<script type="text/javascript" src="../static/js/topNav.js" ></script>
	<script type="text/javascript" src="../static/js/focus.js" ></script>
	<script type="text/javascript" src="../static/js/shop_home_tab.js" ></script>
	<style type="text/css">
		#product{
			border-top:1px solid #E7E7E7;
			width: 1000px;
			margin-top: 40px;
			margin-bottom: 40px;
		}
	</style>
	<script type="text/javascript">
		function Check() {
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
				<p>您好，欢迎来到<b><a href="/">ShopCZ商城</a></b>
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
							<a href = "javascript:void(0);" onclick="Check()">购物车<b>${count}</b>种商品</a>
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
						<input type="text" class="search_form_text" name="search_content"  placeholder="搜索其实很简单！" />
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

		<div class="shop_hd_menu_all_category shop_hd_menu_hover"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
			<div class="shop_hd_menu_all_category_title"><h2 title="所有商品"><a href="/user/index">所有商品</a></h2></div>
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
<#--					<li id="cat_10" class="">-->
<#--						<h3><a href="" title="男女服装">男女服装</a></h3>-->
<#--					</li>-->
				</ul>
			</div>
		</div>
		<!-- 所有商品菜单 END -->

		<!-- 普通导航菜单 -->
		<ul class="shop_hd_menu_nav">
			<li class="current_link"><a href=""><span>首页</span></a></li>
			<li class="link"><a href=""><span>团购</span></a></li>
			<li class="link"><a href=""><span>品牌</span></a></li>
			<li class="link"><a href=""><span>优惠卷</span></a></li>
			<li class="link"><a href=""><span>积分中心</span></a></li>
			<li class="link"><a href=""><span>运动专场</span></a></li>
			<li class="link"><a href=""><span>微商城</span></a></li>
		</ul>
		<!-- 普通导航菜单 End -->
	</div>
	<!-- Header Menu End -->



</div>
<div class="clear"></div>
<!-- Header End -->


<!-- Body -wll-2013/03/24 -->
<div class="shop_bd clearfix">
	<!-- 第一块区域  -->
	<div class="shop_bd_top clearfix">
		<div class="shop_bd_top_left"></div>
		<div class="shop_bd_top_center">
			<!-- 图片切换  begin  -->
			<div class="xifan_sub_box">
				<div id="p-select" class="sub_nav"><div class="sub_no" id="xifan_bd1lfsj"> <ul></ul></div></div>
				<div id="xifan_bd1lfimg">
					<div>
						<dl class=""></dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/e2dfe57add8fff66ed0964b1effd39b9.jpg" alt="2011城市主题公园亲子游"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">2011城市主题公园亲子游</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/e50b5d398e3b890f08e14defbc71a94d.jpg" alt="潜入城市周边清幽之地"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">潜入城市周边清幽之地</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/196b173f15685a2019ab3396cd1851a4.jpg" alt="盘点中国最美雪山"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">盘点中国最美雪山</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/e81345cbc3d8a7e11f9a0e09df68221d.jpg" alt="2011西安世园会攻略"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">2011西安世园会攻略</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/65662b58848da87812ba371c7ff6c1ad.jpg" alt="五月乐享懒人天堂塞班岛"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">五月乐享懒人天堂塞班岛</a></h2></dd>
						</dl>

						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/e50b5d398e3b890f08e14defbc71a94d.jpg" alt="潜入城市周边清幽之地"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">潜入城市周边清幽之地</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/196b173f15685a2019ab3396cd1851a4.jpg" alt="盘点中国最美雪山"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">盘点中国最美雪山</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/e81345cbc3d8a7e11f9a0e09df68221d.jpg" alt="2011西安世园会攻略"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">2011西安世园会攻略</a></h2></dd>
						</dl>
						<dl class="">
							<dt><a href="http://www.zztuku.com" title="" target="_blank"><img src="../static/images/65662b58848da87812ba371c7ff6c1ad.jpg" alt="五月乐享懒人天堂塞班岛"></a></dt>
							<dd><h2><a href="http://www.zztuku.com" target="_blank">五月乐享懒人天堂塞班岛</a></h2></dd>
						</dl>
					</div>
				</div>
			</div>
			<script type="text/javascript">movec();</script>
			<!-- 图片切换  end -->
			<div class="clear"></div>
			<div class="shop_bd_top_center_hot"><img src="../static/images/index.guanggao.png" /></div>
		</div>

		<!-- 右侧 -->
		<div class="shop_bd_top_right clearfix">
			<div class="shop_bd_top_right_quickLink">
				<a href="/userLogin/login" class="login" title="会员登录"><i></i>会员登录</a>
				<a href="/userLogin/register" class="register" title="免费注册"><i></i>免费注册</a>
				<a href="#" class="join" title="商家开店" ><i></i>帮助中心</a>
			</div>

			<div class="shop_bd_top_right-style1 nc-home-news">
				<ul class="tabs-nav">
					<li><a href="javascript:void(0);" class="hover">商城广告</a></li>
					<li><a href="javascript:void(0);">关于我们</a></li>
				</ul>
				<div class="clear"></div>
				<div class="tabs-panel">
					<ul class="list-style01">
						<li><a title="如何申请开店" href="#">如何申请开店</a><span>(2011-01-11)</span></li>
						<li><a title="商城商品推荐" href="#">商城商品推荐</a><span>(2011-01-11)</span></li>
						<li><a title="如何发货" href="#">如何发货</a><span>(2011-01-11)</span></li>
						<li><a title="查看售出商品" href="#">查看售出商品</a><span>(2011-01-11)</span></li>
						<li><a title="如何管理店铺" href="#">如何管理店铺</a><span>(2011-01-11)</span></li>
						<li><a title="如何申请开店" href="#">如何申请开店</a><span>(2011-01-11)</span></li>
						<li><a title="商城商品推荐" href="#">商城商品推荐</a><span>(2011-01-11)</span></li>
						<li><a title="如何发货" href="#">如何发货</a><span>(2011-01-11)</span></li>
						<li><a title="查看售出商品" href="#">查看售出商品</a><span>(2011-01-11)</span></li>
						<li><a title="如何管理店铺" href="#">如何管理店铺</a><span>(2011-01-11)</span></li>

					</ul>
				</div>
			</div>


		</div>
		<!-- 右侧 End -->
	</div>
	<!-- 第二块区域 -->
	<div class="shop_bd_2 clearfix">
		<!-- 特别推荐 -->
		<div class="shop_bd_tuijian">
			<ul class="tuijian_tabs">
				<li class="hover"  onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');" onclick="return false;" id="tuijian_content_btn_1"><a href="javascript:void(0);">活动促销</a></li>
				<li onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');" onclick="return false;" id="tuijian_content_btn_2" ><a href="javascript:void(0);">热门商品</a></li>
				<li onmouseover="easytabs('1', '3');" onfocus="easytabs('1', '3');" onclick="return false;" id="tuijian_content_btn_3"><a href="javascript:void(0);">新品上架</a></li>
			</ul>
			<div class="tuijian_content">
				<div id="tuijian_content_1" class="tuijian_shangpin" style="display: block;">
					<ul>
						<#list list1 as item1>
						<li>
							<dl>
								<dt><a href="/user/goods?productId=${item1.productId}"><img src="${item1.photoUrl}" style="width: 120px;height: 150px" /></a></dt>
								<dd><a href="/user/goods?productId=${item1.productId}" style="font-size: 16px">${item1.productTitle}</a></dd>
								<dd> 商城价：<em>${item1.productNewPrice}</em>元</dd>
							</dl>
						</li>
						</#list>

					</ul>
				</div>

				<div id="tuijian_content_2" class="tuijian_shangpin">
					<ul>
						<#list list2 as item2>
							<li>
								<dl>
									<dt><a href="/user/goods?productId=${item2.productId}"><img src="${item2.photoUrl}" style="width: 120px;height: 150px" /></a></dt>
									<dd><a href="/user/goods?productId=${item2.productId}" style="font-size: 16px">${item2.productTitle}</a></dd>
									<dd> 商城价：<em>${item2.productNewPrice}</em>元</dd>
								</dl>
							</li>
						</#list>
					</ul>
				</div>
				<div id="tuijian_content_3" class="tuijian_shangpin tuijian_content">
					<ul>
						<#list list3 as item3>
							<li>
								<dl>
									<dt><a href="/user/goods?productId=${item3.productId}"><img src="${item3.photoUrl}" style="width: 120px;height: 150px" /></a></dt>
									<dd><a href="/user/goods?productId=${item3.productId}" style="font-size: 16px">${item3.productTitle}</a></dd>
									<dd> 商城价：<em>${item3.productNewPrice}</em>元</dd>
								</dl>
							</li>
						</#list>

					</ul>
				</div>

			</div>

		</div>
		<!-- 特别推荐 End -->



	</div>
	<div class="clear"></div>
	<!-- 第二块区域 End -->

	<div id="product">
	<div class="tuijian_content">
		<div id="tuijian_content_1" class="tuijian_shangpin" style="display: block;">
			<ul>
				<#if list?? && (list?size > 0)>
				<#list list as item>
					<li>
						<dl>
							<dt><a href="/user/goods?productId=${item.product_id}"><img src="${item.photo_url}" style="width: 120px;height: 150px" /></a></dt>
							<dd><a href="/user/goods?productId=${item.product_id}" style="font-size: 16px">${item.product_title}</a></dd>
							<dd> 商城价：<em>${item.product_new_price}</em>元</dd>
						</dl>
					</li>
				</#list>
				<#else>
				 <div style="font-size:large; margin-top: 40px; color: firebrick">暂无商品 //(ㄒoㄒ)//</div>
				</#if>
		</div>

    </div>
	</div>
	<div class="clear"></div>
	<div class="faq">
		<dl>
			<dt>帮助中心</dt>
			<dd><a href=""><span>积分兑换说明</span></a></dd>
			<dd><a href=""><span>积分明细</span></a></dd>
			<dd><a href=""><span>查看已购买商</span></a></dd>
			<dd><a href=""><span>我要买</span></a></dd>
			<dd><a href=""><span>忘记密码</span></a></dd>
		</dl>

		<dl>
			<dt>店主之家</dt>
			<dd><a href=""><span>如何申请开店</span></a></dd>
			<dd><a href=""><span>商城商品推荐</span></a></dd>
			<dd><a href=""><span>如何发货</span></a></dd>
			<dd><a href=""><span>查看已售商品</span></a></dd>
			<dd><a href=""><span>如何管理店铺</span></a></dd>
		</dl>

		<dl>
			<dt>支付方式</dt>
			<dd><a href=""><span>公司转账</span></a></dd>
			<dd><a href=""><span>邮局汇款</span></a></dd>
			<dd><a href=""><span>分期付款</span></a></dd>
			<dd><a href=""><span>在线支付</span></a></dd>
			<dd><a href=""><span>如何注册支付</span></a></dd>
		</dl>

		<dl>
			<dt>售后服务</dt>
			<dd><a href=""><span>退款申请</span></a></dd>
			<dd><a href=""><span>返修/退换货</span></a></dd>
			<dd><a href=""><span>退换货流程</span></a></dd>
			<dd><a href=""><span>退换货政策</span></a></dd>
			<dd><a href=""><span>联系卖家</span></a></dd>
		</dl>

		<dl>
			<dt>客服中心</dt>
			<dd><a href=""><span>修改收货地址</span></a></dd>
			<dd><a href=""><span>商品发布</span></a></dd>
			<dd><a href=""><span>会员修改个人</span></a></dd>
			<dd><a href=""><span>会员修改密码</span></a></dd>

		</dl>

		<dl>
			<dt>关于我们</dt>
			<dd><a href=""><span>合作及洽谈</span></a></dd>
			<dd><a href=""><span>招聘英才</span></a></dd>
			<dd><a href=""><span>联系我们</span></a></dd>
			<dd><a href=""><span>关于Shop</span></a></dd>
		</dl>


	</div>
	<div class="clear"></div>
</div>
<!-- Body End -->

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="../static/aaaa/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="../static/aaaa/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../static/aaaa/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="../static/aaaa/css/jsstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../static/aaaa/js/address.js"></script>

		<link rel="stylesheet" href="../static/css/base.css" type="text/css" />
		<link rel="stylesheet" href="../static/css/shop_common.css" type="text/css" />
		<link rel="stylesheet" href="../static/css/shop_header.css" type="text/css" />
		<link rel="stylesheet" href="../static/css/shop_home.css" type="text/css" />
		<script type="text/javascript" src="../static/js/jquery.js" ></script>
		<script type="text/javascript" src="../static/js/topNav.js" ></script>
		<script type="text/javascript" src="../static/js/focus.js" ></script>
		<script type="text/javascript" src="../static/js/shop_home_tab.js" ></script>

		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

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
										<li><a title="已买到的商品" target="_top" href = "/user/orderlist">已买的商品</a></li>
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
		</div>
		<div class="clear"></div>
		<!-- TopHeader Center End -->

			<div class="clear"></div>
			<div class="concent">
					<!--物流 -->
					<div class="logistics">
						<h3 style="font-weight: bold;margin-bottom: 10px;margin-top: 30px">选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3 style="font-weight: bold;margin-bottom: 10px;margin-top: 30px">选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="../static/aaaa/images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="../static/aaaa/images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="../static/aaaa/images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3 style="font-weight: bold;margin-bottom: 10px;margin-top: 30px">确认订单信息</h3>
							<table class="table table-striped" style="width: 1000px">
								<tr>
									<th colspan="2" style="align-content: center;font-weight: bold">商品信息</th>
									<th style="font-weight: bold">单价</th>
									<th style="font-weight: bold">数量</th>
									<th style="font-weight: bold">总金额</th>
								</tr>
									<#list list as item>
								<tr>
									<td><img src="${item.photoUrl}" style="height: 50px;width: 50px"></img></td>
									<td>${item.productTitle}</td>
									<td>￥${item.productNewPrice}</td>
									<td>${item.quantity}</td>
									<td>￥${item.totalPrice}</td>
								</tr>
									</#list>
								</tr>

							</table>


							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" id="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${total}</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">${userAddress}
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user">${userName} </span>
												<span class="buy-phone">${userphone}</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" onclick="submitOrder()" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有</em>
						</p>
					</div>
				</div>
			</div>
			<div class="theme-popover-mask"></div>

			<div class="clear"></div>

		<script type="text/javascript">
			function submitOrder() {
				var text = document.getElementById("text").value;
				var index = ${index}
				if(index==1){
					location.href='/user/inserOrder?productId=${productId}&quantity=${quantity}&text='+text;
				}else{
					location.href='/user/inserOrders?text='+text+'&shoppingListId=${shoppingListId}';
				}

			}
		</script>
		
	</body>

</html>
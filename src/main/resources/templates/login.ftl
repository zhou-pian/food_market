<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户登录</title>
	<link rel="stylesheet" href="../static/css/base.css" />
	<link rel="stylesheet" href="../static/css/global.css" />
	<link rel="stylesheet" href="../static/css/login-register.css" />
	<script type="text/javascript" src="../static/js/jquery-2.1.0.js"></script>

</head>

<body>
<!--顶部信息start-->
<!--
<div id="topnav">
    <div class="topwrap">
        <dl class="user-entry">
            <dt>您好，欢迎来到ShopCZ商城<a href=""></a></dt>
            <dd>[<a href="">登录</a>]</dd>
            <dd>[<a href="">注册</a>]</dd>
            <dd></dd>
        </dl>
        <ul class="quick-menu">
            <li class="user-center">
                <div class="menu">
                    <a href="" class="menu-hd">我的商城</a>
                    <div class="menu-bd">
                        <ul>
                            <li><a href="">已买到的商品</a></li>
                            <li><a href="">我的空间</a></li>
                            <li><a href="">我的好友</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="cart">
                <div class="menu">
                    <span class="menu-hd">购物车<strong>0</strong>种商品</span>
                    <div class="menu-bd">
                        <div class="no-order">
                            <span>您的购物车中暂无商品，赶快选择心爱的商品吧！</span>
                            <a href="" class="button">查看购物车</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="favorite">
                <div class="menu">
                    <a href="" class="menu-hd">我的收藏</a>
                    <div class="menu-bd">
                        <ul>
                            <li><a href="">收藏的商品</a></li>
                            <li><a href="">收藏的店铺</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="pm">
                <a href="">站内信</a>
            </li>
        </ul>
    </div>
</div>
-->
<!--顶部信息end-->

<div class="header wrap1000">
	<a href=""><img src="../static/images/logo.png" alt="" /></a>
</div>

<div class="main">
	<div class="login-form fr">
		<div class="form-hd">
			<h3>用户登录</h3>
		</div>
		<div class="form-bd">
			<form action="/userLogin/login_success" method="post" onsubmit="return CheckPasswd()">
				<dl>
					<dt>用户名</dt>
					<dd><input id="user" type="text" name="user" class="text" /></dd>
				</dl>
				<dl>
					<dt>密&nbsp;&nbsp;&nbsp;&nbsp;码</dt>
					<dd><input id="password" type="password" name="password" class="text"/></dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="1" name="use" checked>用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" value="2" name="use">管理员</dd>
				</dl>
				<dl>
					<dt>&nbsp;</dt>
					<dd><input type="submit" value="登  录" class="submit"/> <a href = "javascript:void(0);" onclick="forgetPasswd()" class="forget">忘记密码?</a></dd>
				</dl>
			</form>
			<dl>
				<dt>&nbsp;</dt>
				<dd> 还不是本站会员？立即 <a href="/userLogin/register" class="register">注册</a></dd>
			</dl>

		</div>
		<div class="form-ft">

		</div>
	</div>

	<div class="login-form-left fl">
		<img src="../static/images/left.jpg" alt="" />
	</div>
</div>

<div class="footer clear wrap1000">
	<p> <a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a href="">关于ShopCZ</a> | <a href="">联系我们</a></p>
	<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
</div>

<script>
	function CheckPasswd() {
		var f = false;
		//获取用户输入的用户名
		var name = document.getElementById("user").value;
		//获取用户输入的密码
		var passwd = document.getElementById("password").value;
		//用户或者管理员
		var radio = document.getElementsByName("use");
		var result;//1代表选择用户，2代表选中管理员
		for(i = 0;i < radio.length;i++){
			if(radio[i].checked){
				result = radio[i].value;
			}
		}
		//去除字符串两端空格
		name = name.trim();
		passwd = passwd.trim();
		$.ajax({
			url:"/userLogin/check",
			type:"post",
			data:{"name":name, "passwd": passwd,"result":result}, //json数据格式的用户名从jsp传递给controller
			dataType:"json",
			async:false, // 让ajax执行代码顺序同步
			success: function (data) {
				if (data.msg == "false") {
					alert("用户名或密码输入错误!");
				}
				else {
					alert(name+" 用户,欢迎您");
					f=true;
				}
			}
		});
		return  f;
	}

	function forgetPasswd() {
		//获取用户输入的用户名
		var name = document.getElementById("user").value.trim();
		if(name == ""){
			alert("请输入用户名！")
		}else{
			location.href='/userLogin/forgetpasswd?userName='+name;
		}

	}
</script>

</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>用户注册</title>
	<link rel="stylesheet" href="../static/css/base.css" />
	<link rel="stylesheet" href="../static/css/global.css" />
	<link rel="stylesheet" href="../static/css/login-register.css" />
	<script type="text/javascript" src="../static/js/jquery-2.1.0.js"></script>

</head>
<body>
<div class="header wrap1000">
	<a href=""><img src="../static/images/logo.png" alt="" /></a>
</div>

<div class="main">
	<div class="login-form fr">
		<div class="form-hd">
			<h3>用户注册</h3>
		</div>
		<div class="form-bd">
			<form action="/userLogin/insertUser" method="post" onsubmit="return check() ">
				<dl>
					<dt>用户名</dt>
					<dd><input type="text" id="userName" name="userName" class="text" /></dd>
				</dl>
				<dl>
					<dt>密码</dt>
					<dd><input type="password" id="password" name="userPassword" class="text"/></dd>
				</dl>
				<dl>
					<dt>确认密码</dt>
					<dd><input type="password" id="passwordRepeat" name="passwordRepeat" class="text"/></dd>
				</dl>
				<dl>
					<dt>手机号</dt>
					<dd><input type="text" id="phone" name="userPhone" class="text"/></dd>
				</dl>
				<dl>
					<dt>验证码</dt>
					<dd><input type="text" id="code" name="code" class="text" size="6" style="width:100px;"><button type="button" class="btn" id="sendMobileCode" onclick="sendCode()" style="height: 30px;width:110px; font-size: 13px;">获取验证码</button></dd>
				</dl>
				<dl>
					<dt>地址</dt>
					<dd><input type="text" id="userAddress" name="userAddress" class="text"/></dd>
				</dl>
				<dl>
					<dt>&nbsp;</dt>
					<dd><input type= "checkbox" id="agreement" name="agreement"/>阅读并同意<a href="" class="forget">服务协议</a></dd>
				</dl>

				<dl>
					<dt>&nbsp;</dt>
					<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="立即注册" class="submit"/> </dd>
				</dl>
			</form>

		</div>
		<div class="form-ft">

		</div>
	</div>

	<div class="login-form-left fl">
		<dl class="func clearfix">
			<dt>注册之后您可以</dt>
			<dd class="ico05"><i></i>购买商品支付订单</dd>
			<dd class="ico01"><i></i>申请开店销售商品</dd>
			<dd class="ico03"><i></i>空间好友推送分享</dd>
			<dd class="ico02"><i></i>收藏商品关注店铺</dd>
			<dd class="ico06"><i></i>商品资讯服务评价</dd>
			<dd class="ico04"><i></i>安全交易诚信无忧</dd>
		</dl>

		<div class="if">
			<h2>如果您是本站用户</h2>
			<p>我已经注册过账号，立即 <a href="/userLogin/login" class="register">登录</a>
		</div>
	</div>
</div>

<div class="footer clear wrap1000">
	<p> <a href="">首页</a> | <a href="">招聘英才</a> | <a href="">广告合作</a> | <a href="">关于ShopCZ</a> | <a href="">联系我们</a></p>
	<p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
</div>
<script>
	var wait = 60;
	var a = document.getElementById('sendMobileCode');
	function sendCode () {
		var phone = document.getElementById("phone").value;
		if (phone == "" || phone.length != 11) {
			alert("请输入正确的手机号");
		} else {
			setButtonStatus(); //设置按钮倒计时
			$.ajax({
				url: "/userLogin/sendCode",
				type: "post",
				data: {"phone": phone}, //json数据格式的用户名从jsp传递给controller
				dataType: "json",
				async: false, // 让ajax执行代码顺序同步
				success: function (data) {
					if (data.msg == "成功") {
						alert("shopCZ已向 "+phone+'发送短信验证码，请注意查收');
					} else {
						alert(data.msg);
					}
				}
			});
		}
	}

		function setButtonStatus() {
			if (wait == 0) {
				a.disabled="";
				a.innerHTML = "获取验证码";
				wait = 60;
			} else {
				a.disabled = "disabled";
				a.innerHTML = wait + "秒后重新发送";
				wait--;
				setTimeout(function () {
					setButtonStatus()
				}, 1000)
			}
		}

		function check() {
			var f = false;
			var code = document.getElementById("code").value.trim();
			var password = document.getElementById("password").value.trim();
			var passwordRepeat = document.getElementById("passwordRepeat").value.trim();
			var userName = document.getElementById("userName").value.trim();
			var agreement = document.getElementById("agreement").checked;
			$.ajax({
				url: "/userLogin/checkPassword",
				type: "post",
				data: {
					"userName":userName,
					"code": code,
					"password": password,
					"passwordRepeat": passwordRepeat,
					"agreement":agreement
				}, //json数据格式的用户名从jsp传递给controller
				dataType: "json",
				async: false, // 让ajax执行代码顺序同步
				success: function (data) {
					console.log(data)
					if (data.msg=="注册成功") {
						alert(data.msg);
						f = true;
					} else {
						alert(data.msg);
					}
				}

			});
			console.log(f);
			return f;
		}
</script>

</body>
</html>

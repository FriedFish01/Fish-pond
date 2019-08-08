<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册/登录</title>
<link rel="stylesheet" href="css/animate-custom.css" type="text/css"></link>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<script type="text/javascript">
	var isShow = true;

	function change() {
		var v = document.getElementById("passwordsignup");
		var v2 = document.getElementById("passwordsignup2");
		if (isShow) {
			v.type = "text";
			v2.type = "text";
			isShow = false;
		} else {
			v.type = "password";
			v2.type = "password";
			isShow = true;
		}
	};

	function checkphone() {
		var tel = document.getElementById("tel").value;
		if (!(/^1[3579]\d{9}$/.test(tel))) {
			alert('请填写正确的11位手机号码');
			$("#msg").html("至少输入12个字符");
			return false;
		}
	};

	$(function() {
		jQuery.validator.addMethod("isMobile", function(value, element) {
			var pattern = /^(13[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/;
			return this.optional(element)
					|| (value.length == 11 && pattern.test(value));
		});
		$("#messagesForm").validate({
			rules : {
				"messages.phone" : {
					required : true,
					isMobile : true
				}
			},
			messages : {
				"messages.phone" : {
					required : "*手机号不能为空！",
					isMobile : "*请输入格式正确的11位手机号！"
				}
			}
		});
	});

	function checkpwd() {
		var p1 = document.getElementById("passwordsignup").value; //获取密码框的值
		var p2 = document.getElementById("passwordsignup2").value; //获取重新输入的密码值
		if (p1 != p2) { //判断两次输入的值是否一致，不一致则显示错误信息
			document.getElementById("msg").innerHTML = "两次输入密码不一致，请重新输入"; //在div显示错误信息
			return true;
		} else {
			document.getElementById("msg").innerHTML = ""; //在div显示错误信息
			return false;
		}
	};
</script>
</head>
<body
	style="background: #fff url(${pageContext.request.contextPath}/resources/images/bg.jpg) repeat top left;">
	<div id="container_demo">
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div class="animate form" id="login">
				<form action="doLogin" autocomplete="on" method="post">
					<h1>登录</h1>
					<p>
						<label class="uname" data-icon="u" for="username">您的用户名</label> <input
							id="username" name="username" placeholder="请输入用户名"
							required="required" type="text" />
					</p>
					<p>
						<label class="youpasswd" data-icon="p" for="password">你的密码</label>
						<input id="password" name="password" placeholder="请输入密码"
							required="required" type="password" />
					</p>
					<p>
						<span style="color: red;font-size: 18px" id="msg">${msg}</span>
					</p>
					<p class="login button">
						<input type="submit" value="登录" id="enter" />
					</p>
					<p class="change_link">
						不是成员?<a class="to_register" href="#toregister">加入我们</a>
					</p>
				</form>
			</div>
			<div class="animate form" id="register">
				<form action="saveUsers" id="usersFrm" autocomplete="on" method="post">
					<input type="hidden" name="id" value="${id}"/>
					<input type="hidden" name="userName" value="${users.id}"/>
					<h1>注册</h1>
					<table class="tbFood">
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="users.userName" id="username"
								value="${users.userName}" style="width:300px;height:25px;"/></td>
							<td><span class="clear"></span></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="text" name="users.password"
								value="${users.password}" style="width:300px;height:25px;"/></td>
							<td></td>
						</tr>
						<tr >
							<td></td>
							<td style="float:right; padding-top:30px;">
								<input type="submit" value="确认注册" style="width:100px; padding:5px;"/> 
								<input type="button" value="返回首页" style="width:100px; padding:5px;" onclick="window.location='index'" />
							</td>
						</tr>
					</table>
					<p class="change_link">
						已经是成员?<a class="to_register" href="#userFrm"> 去登录 </a>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
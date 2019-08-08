<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>header.jsp</title>

<link href="css/header.css" rel="stylesheet" />

<div id="header">
	<div id="corpTitle">美食前线</div>
	<div id="rightTitle">
		<ul class="cl">
			<li class="d">超级管理员</li>
			<li class="dropDown dropDown_hover">
				<a href="#" class="dropDown_A"  style="color:white;">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
				<ul class="dropDown-menu menu radius box-shadow">
					<li>
						<a href="javascript:;" onClick="myselfinfo()">个人信息</a>
					</li>
					<li>
						<a href="#">切换账户</a>
					</li>
					<li>
						<a href="../index"  style="color:white;text-decoration: none;">前台页面</a>
					</li>
					<li>
						<a href="#">退出</a>
					</li>
				</ul>
			</li>
		</ul>
		<a href="../index"  style="color:white;text-decoration: none;">前台页面</a>
	</div>
</div>
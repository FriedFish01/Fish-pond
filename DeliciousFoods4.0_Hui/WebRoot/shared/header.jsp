<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>header.jsp</title>
<link href="css/header.css" rel="stylesheet"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header">
	<div id="menu">
		<div id="corpTile">美食在线</div>
		
		<div id="fastNav">
			<ul>
				<li><a href="index">首页</a></li>
				<li><a href="foodslist">产品展示</a></li>
				<li><a href="newslist">生活资讯</a></li>
				<li><a href="messages">留言建议</a></li>
				<li>联系我们</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div id="logo"><img src="image/header.jpg"/></div>
	<div class="right">
		<c:if test="${sessionScope.users!=null }">
			<div class="pdname">
				<span><b>欢迎你，${sessionScope.users.userName}.</b></span>
				<span>最后登录:<fmt:formatDate value="${sessionScope.users.lastLoginTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
			</div>
			<div >
				<span class="pdleft">
					<c:if test="${sessionScope.users.idAdmin==0 }">
						<a href="admin/foods_list">后台管理</a>
					</c:if>
					&nbsp;<a href="signOut">退出登录</a>
				</span>
			</div>
		</c:if>
		</div>
	<div class="clear"></div>
</div>
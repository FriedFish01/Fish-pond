<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>error.jsp</title>
	<link href="css/base.css" rel="stylesheet"/>
  </head>
  <body>
    <div id="page">
    	<!-- 页眉 -->
    	<%@include file="shared/header.jsp" %>
    	<!-- 主体 -->
    	<div id="main">
			<!-- 左侧导航 -->
			<%@include file="shared/nav.jsp"%>
			<!-- 右侧内容 --> 
    		<div id="container"></div>
    		<div style="text-align:center;width:350px;">
    			
    			<c:if test="${sessionScope.users==null }">
    				<p style="font-size:24px;color:red;">未登录或无权限访问后台数据，请先登录或获取权限。</p>
    			</c:if>
    			<c:if test="${sessionScope.users.idAdmin==0 }">
    				<p style="font-size:24px;color:red;">未登录！请先登录。</p>
    			</c:if>
    			<c:if test="${sessionScope.users!=null&&sessionScope.users.idAdmin==1 }">
    				<p style="font-size:24px;color:red;">非管理员登录，没有访问权限!!!</p>
    			</c:if>
    		</div>
    		<div class="clear"></div>
    	</div>
    	<!-- 页脚 -->
    	<%@include  file="shared/footer.jsp"%>
    </div>
  </body>
</html>

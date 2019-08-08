<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  </head>
  
  <body>
  <p>test is myjsp.jsp</p>
    <div id="page">
    	<!-- 页眉 -->
    	<%@include file="shared/header.jsp" %>
    	<!-- 主体 -->
    	<div id="main">
			<!-- 左侧导航 -->
			<%@include file="shared/nav.jsp"%>
			<!-- 右侧内容 --> 
    		<div id="productList">
	    		<span>美食列表</span>
	    			<!-- item对应action的集合 -->
	    			<c:forEach var="foods" items="${foodsList}">
	    				<p>c:foreach进不来</p>
	    				<span>${foods.chinesename}</span>
	    			</c:forEach>
		    	<div>
		    	<span>新闻列表</span>
		    		<c:forEach var="news" items="${newsList}">
	    				<div>${news.title }</div>
	    			</c:forEach>
		    	</div>
    		</div>
    	</div>
    	<!-- 页脚 -->
    	<%@include  file="shared/footer.jsp"%>
    </div>
  </body>
</html>

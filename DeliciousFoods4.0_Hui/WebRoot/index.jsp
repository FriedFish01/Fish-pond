<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>index.jsp</title>
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
    		<div class="productList">
	    		<p class="mainTitle">美食菜单</p>
	    		<hr />
	    			<!-- item对应action的集合 -->
	    			<c:forEach var="foods" items="${foodsList}">
	    				<div class="product">
	    						<a href="details?id=${foods.id}"><img src="image/menus/${foods.englishName}.jpg"/></a>
	    					<br/>
	    					<span>菜名：${foods.chineseName}</span>
	    				</div>
	    			</c:forEach>
    		</div>
    		<div class="topNewsList">
		    	<p class="mainTitle">生活资讯</p>
		    	<hr />
		    	<c:forEach var="news" items="${newsList}">
	    			<div class="news">
	    				<div class="newsTitle"><a href="newsdetails?id=${news.id}">${news.title}</a></div>
	    				<div class="newsDate"><fmt:formatDate value="${news.publishDate}" pattern="yyyy-MM-dd"/></div>
	    				<div class="clear"></div>
	    			</div>
	    		</c:forEach>
		    </div>
    	</div>
    	<!-- 页脚 -->
    	<%@include  file="shared/footer.jsp"%>
    </div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>foodslist.jsp</title>
		<link href="css/foodslist.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="page">
			<!-- 页眉 -->
	    	<%@include file="shared/header.jsp" %>
	    	<!-- 主体 -->
	    	<div id="main">
				<!-- 左侧导航，调用子acting实现 -->
				<s:action name="sidebar" executeResult="true" namespace="/"></s:action>
				
				<!-- 右侧内容 --> 
	    		<div class="productTitle">
					<span class="List">产品列表</span>
					<hr class="solid"/>
					<span>当前条件：
						<!-- 查询条件 -->
						<c:if test="${ not empty categoryName }">
							${categoryName}<a href="foodslist?title=${title}">[删除]</a>
						</c:if>
						&nbsp;&nbsp;
						<c:if test="${ not empty title }">
							${title}<a href="foodslist?cid=${cid}">[删除]</a>
						</c:if>
					</span>
	    		</div>
	    		<div class="productList">
					<c:forEach var="foods" items="${foodsList}">
						<div class="productDetail">
							<a href="#"><a href="details?id=${foods.id}"><img src="image/menus/${foods.englishName}.jpg"/></a></a>
							<br/>
							<span>${foods.chineseName}</span>
						</div>
					</c:forEach>
					
			    </div>
			    <div class="clear"></div>
			    <div class="pager">
			    	<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
			    	<a href="foodslist?pageNum=${pageNum-1}&cid=${cid}&title=${title}">上一页</a>			    	
			    	</c:if>
			    	<c:if test="${ pageNum<pageCount }">
			    	<a href="foodslist?pageNum=${pageNum+1}&cid=${cid}&title=${title}">下一页</a>
			    	</c:if>
			    	&nbsp;&nbsp;<span>共${pageCount}页，当前第${ pageNum }页</span>
			    </div>
	    	</div>
	    	<!-- 页脚 -->
	    	<%@include  file="shared/footer.jsp"%>
		</div>
	</body>
</html>

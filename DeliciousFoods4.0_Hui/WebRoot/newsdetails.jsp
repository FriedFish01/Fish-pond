<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>foodsdetails.jsp</title>
	<link href="css/newslist.css" rel="stylesheet"/>
</head>
<body>
	<div id="page">
		<!-- 页眉 -->
		<%@ include file="shared/header.jsp" %>
		<div id=main>
			<!-- 左侧导航，调用子action -->
			<s:action name="sidebar" executeResult="true" namespace="/"></s:action>
			<div id="container">
				<div class="newsDetailsTitle">&nbsp;&nbsp;${news.title}</div>
				<div class="newsDetailsDate">&nbsp;&nbsp;<fmt:formatDate value="${news.publishDate}" pattern="yyyy-MM-dd"/></div>
				<div class="newsContent">
					<span class="temp">&nbsp;&nbsp;${news.content}</span>
				</div>
				
				<div class="pager">
				    <!-- 页码 -->
				    <c:if test="${nextId>0}">
				    	<a href="newsdateails?id=${prevId}">上一篇</a>
				    </c:if>
				    
				    <c:if test="${nextId>0}">
				    	<a href="newsdateails?id=${nextId}">下一篇</a>
				    </c:if>
				    <a href="newsdateails?id=${prevId}">上一篇</a>
				    <a href="newsdateails?id=${nextId}">下一篇</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 主体 -->
		
		<!-- 页脚 -->
		<%@include file="shared/footer.jsp" %>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>newslist.jsp</title>
		<link href="css/newslist.css" rel="stylesheet"/>
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
	    		<div class="container">
					<span class="title">生活资讯</span>
					<p></p>
					<table class="tbNews">
						<c:forEach var="news" items="${newsList}">
							<tr class="trNews">
								<td class="tbNews1"><a href="newsdetails?id=${news.id }">${news.title}</a></td>
								<td class="tbNews2"><fmt:formatDate value="${news.publishDate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							
						</c:forEach>
						
					</table>
					<div class="pager">
				    	<!-- 页码 -->
				    	<c:if test="${ pageNum>1 }">
				    	<a href="newslist?pageNum=${pageNum-1}">上一页</a>			    	
				    	</c:if>
				    	<c:if test="${ pageNum<pageCount }">
				    	<a href="newslist?pageNum=${pageNum+1}">下一页</a>
				    	</c:if>
				    	&nbsp;&nbsp;<span>共${pageCount}页，当前第${ pageNum }页</span>
				    </div>
	    		</div>
			    <div class="clear"></div>
	    	</div>
	    	<!-- 页脚 -->
	    	<%@include  file="shared/footer.jsp"%>
		</div>
	</body>
</html>

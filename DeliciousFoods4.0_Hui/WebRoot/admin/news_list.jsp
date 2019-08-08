<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>news_lists.jsp</title>
	<link href="css/news_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script>
		$(function(){
			$(".del").click(function(){
				return confirm("确认删除？");
			});
		});
	</script>
</head>
	
<body>
	<div id="page">
		<!-- 页眉 -->
		<%@ include file="shared/header.jsp" %>
		<!-- 主体 -->
		<div id=main>
			<%@ include file="shared/nav.jsp" %>
				<p class="p1"></p>
				<p style="padding-top:10px;width:100%;"> </p>
			<div id="container">
				<p style="padding:20px;">
					<a class="a-primary" href="news_edit" style="border-radius:9px;">
						+ 添加资讯
					</a>
					&nbsp;

					<span style="float:right;padding-right:20px;font-size:20px;">共有数据：${count}条</span>
				</p>
				<table class="tbnewsList">
					<tr>
						<td id="myTd">ID</td>
						<td id="myTd" style="width:220px;">资讯标题</td>
						<td id="myTd">资讯内容</td>
						<td id="myTd">上架时间</td>
						<td id="myTd" style="width:60px;">操作</td>
					</tr>
					<c:forEach var="news" varStatus="status" items="${newsList}">
							<tr>
								<td>${(status.index+1)+((pageNum-1)*pageSize)}</td>
								<td>${news.title}</td>
								<td>${news.content.substring(0,20)}....</td>
								<td><fmt:formatDate value="${news.publishDate}" pattern="yyyy-MM-dd"/></td>
								<td><a href="news_edit?id=${news.id}">编辑</a>&nbsp;&nbsp;<a href="news_delete?id=${news.id}" class="del">删除</a></td>
							</tr>
					</c:forEach>
				</table>
				<div class="pager">
					<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="news_list?pageNum=${pageNum-1}" class="span-p2">
				    		<span>上一页</span>
				    	</a>			    	
			    	</c:if>
			    	<span class="span-p">第${ pageNum }页&nbsp;/&nbsp;共${pageCount}页</span>
			    	<c:if test="${ pageNum<pageCount }">
				    	<a href="news_list?pageNum=${pageNum+1}" class="span-p2">
							<span >下一页</span>
						</a>
			    	</c:if>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
		<!-- 页脚 -->
		<%@include file="shared/footer.jsp" %>
	</div>
</body>
</html>
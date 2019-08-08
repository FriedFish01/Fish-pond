<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>category_list.jsp</title>
	<link href="css/category_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script>
		$(function(){
			$("#btnDisable").click(function(){
				if($("input[type='checkbox'][name='ck']:checked").length>0){
					$("#categoryForm").attr("action","category_delete");
					$("#categoryForm").submit();
					alert("删除成功");
				}
				else{
					alert("请勾选删除对象");
				}
			});
			$("#ckAll").click(function(){
				var cks = document.getElementsByName("ck");
				for(var i=0;i<cks.length;i++){
					cks[i].checked = $(this).get(0).checked;
				}
			});
		});
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
					<a class="a-primary" href="category_edit" style="border-radius:9px;">
						+ 添加类别
					</a>
					&nbsp;
					<a id="btnDisable" class="a-danger" style="border-radius:9px;">
						<img src="../image/delete3.jpg" style="width:15px;height:15px;opacity:0.7;"> 批量删除
					</a>
					<span style="float:right;padding-right:20px;font-size:20px;">共有数据：${count}条</span>
				</p>
				<form id="categoryForm" method="post">
					<table class="tbcategoriesList">
						<tr>
							<td id="myTd" class="tdCheck"><input type="checkbox"name="ckAll" id="ckAll" />全选</td>
							<td id="myTd">ID</td>
							<td id="myTd" style="width:150px;">菜系名称</td>
							<td id="myTd" style="width:100px;">操作</td>
						</tr>
						<c:forEach var="category" varStatus="status" items="${categoriesList}">
							<tr>
								<td><input type="checkbox" name="ck" id="ck "value="${category.id}" /></td>
								<td>${(status.index+1)+((pageNum-1)*pageSize)}</td>
								<td class="tdContent">${category.name}</td>
								<td><a href="category_edit?id=${category.id}">编辑</a>&nbsp;&nbsp;<a
									href="category_delete?id=${category.id}" class="del">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="pager">
			    	<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="category_list?pageNum=${pageNum-1}" class="span-p2">
				    		<span>上一页</span>
				    	</a>			    	
			    	</c:if>
			    	<span class="span-p">第${ pageNum }页&nbsp;/&nbsp;共${pageCount}页</span>
			    	<c:if test="${ pageNum<pageCount }">
				    	<a href="category_list?pageNum=${pageNum+1}" class="span-p2">
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
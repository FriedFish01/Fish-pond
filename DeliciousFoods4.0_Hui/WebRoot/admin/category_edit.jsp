<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>foods_edit.jsp</title>
	<link href="css/category_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../script/jquery.validate.js"></script>
	<script>
		$(function(){
			$("#categoryFrm").validate({
				rules:{
					"categories.name":{required:true},
				},
				messages:{
					"categories.name":{required:"菜系名称不能为空！"}
				}
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
			
			<div id="container2">
				<p class="p1"></p>
				<p style="padding-top:10px;width:100%;"> </p>
				<form action="category_save" method="post" id="categoryFrm">
					<input type="hidden" name="id" value="${id}"/>
					<input type="hidden" name="categories.id" value="${categories.id}"/>
					<table class="tbFoot">
						<tr>
							<td>菜系编号</td>
							<td>${categories.id}</td>
							<td></td>
						</tr>
						<tr>
							<td>菜系名称</td>
							<td><input type="text" name="categories.name" value="${categories.name}"/></td>
							<td><span class="tip" id="msg">*</span></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="submit" value="保存"/>
								<input type="button" value="取消" onclick="window.location='category_list'"/>
							</td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>
		
		<!-- 页脚 -->
		<%@include file="shared/footer.jsp" %>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>foods_edit.jsp</title>
	<link href="css/news_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../script/jquery.validate.js"></script>
	<script>
		$(function(){
			$("#newsFrm").validate({
				rules:{
					"news.name":{required:true},
				},
				messages:{
					"news.name":{required:"资讯标题不能为空！"}
				}
			});
		});

		function ceshi() {
			//获取ckeditor中的文本
			var value = document.getElementById("title").value;
			if (value == "" || value == null) {
				message = "制作流程/美食描述是必填字段！";
				$("#title").html(message);
				return false;
			} else {
				return true;
			}
		}
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
				<form action="news_save" method="post" id="newsFrm">
					<input type="hidden" name="id" value="${id}"/>
					<input type="hidden" name="news.id" value="${news.id}"/>
					<table class="tbNews">
						<tr>
							<td style="width:100px;">资讯标题：</td>
							<td><input type="text" name="news.title" value="${news.title}" id="title" style="width:300px;height:25px;" placeholder="标题不超过25个字符"/></td>
						</tr>
						<tr>
							<td style="width:100px;">资讯内容：</td>
							<td>
								<textarea name="news.content" class="ckeditor" id="content" >${news.content}</textarea>
							</td>
						</tr>
						<tr>
							<td style="width:100px;">上架时间：</td>
							<td>
								
								<input type="date" name="news.publishDate" value="${news.publishDate}" style="width:300px;height:25px;"/>
								
							</td>
						</tr>
						<tr >
							<td></td>
							<td style="float:right;">
								<input type="submit" value="保存" onclick="ceshi"/>
								<input type="button" value="取消" onclick="window.location='news_list'"/>
							</td>
							
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
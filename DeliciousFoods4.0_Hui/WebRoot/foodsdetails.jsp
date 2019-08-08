<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>foodsdetails.jsp</title>
	<link href="css/foodslist.css" rel="stylesheet"/>
	<script type="text/javascript" src="script/jquery-1.10.2.js"></script>
	<script>
		//JSON异步获取评论数据
		function loadComments(){
			$.getJSON("comments",{id:$("#fid").val()},function(data){
				var html="";
				$.each(data,function(i,item){
					html+="<span>"+item["users"]["userName"]+"&nbsp&nbsp&nbsp";
					html+=item["publishDate"]+"&nbsp&nbsp&nbsp";
					html+=item["content"]+"</span><hr/>";
				});
				$("#result").html(html);
			});
		}
		$(function(){
			loadComments();//查重新加载评论（ajax异步）,不用刷新页面
			$("#btnSend").click(function(){
				var uid = $("#uid").val();//用户id
				if(uid==""){
					alert("未登陆，不能发表评论");
					window.location.href="index";
				}
				else{
					var content = $("#content").val();
					if(content==""){
						alert("评论内容不能为空，请输入评论。");
						$("#content").fucus();
					}
					else{
						var id = $("#fid").val();
						$.post("addComments",{content:content,id:id},function(){
							loadComments();//重新加载评论（ajax异步）
							$("#content").val("");
						});
					}
				}
			});
		});
	</script>
	
</head>
<body>
	<div id="page">
		<!-- 页眉 -->
		<%@ include file="shared/header.jsp" %>
		<div id=main>
			<!-- 左侧导航，调用子action -->
			<s:action name="sidebar" executeResult="true" namespace="/"></s:action>
			<div id="container">
				<input type="hidden" id="fid" value="${foods.id}"/>
				<input type="hidden" id="uid" value="${sessionScope.users.id}"/>
				<div id="productTitle">
					<span class="list">&nbsp;产品详情</span>
					<hr/>
					<h3>&nbsp;${foods.chineseName }</h3>
					<div class="detailsImage">
						<img src="image/menus/${foods.englishName}.jpg"/>
					</div>
					<hr/>
					<p>&nbsp;制作方法</p>
					<div>
						<p>${foods.descriptioin}</p>
					</div>
				</div>
				<hr/><h2>用户评论</h2>
				<div id="result"></div>
				<div id="comments">
					<textarea rows="3" cols="60" name="content" id="content"></textarea>
					<input type="button" value="发表评论" id="btnSend">
				</div>
				<div id="pa">
					<a href="foodslist">返回上一页</a>
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
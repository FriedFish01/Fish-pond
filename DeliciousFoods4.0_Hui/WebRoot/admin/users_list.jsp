<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>users_lists.jsp</title>
	<link href="css/users_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script>
		$(function(){
			$("#btnEnable").click(function(){
				if($("input[type='checkbox'][name='ck']:checked").length>0){
					$("#usersFrm").attr("action","users_enable");
					$("#usersFrm").submit();
					alert("修改成功");
				}
				else{
					alert("请选择数据"+"------"+$(".ck:checked").size());
				}
			});
			$("#btnDisable").click(function(){
				if($("input[type='checkbox'][name='ck']:checked").length>0){
					$("#usersFrm").attr("action","users_disable");
					$("#usersFrm").submit();
					alert("修改成功");
				}
				else{
					alert("请选择数据");
				}
			});
			$("#ckAll").click(function(){
				var cks = document.getElementsByName("ck");
				for(var i=0;i<cks.length;i++){
					cks[i].checked = $(this).get(0).checked;
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
			<p class="p1"></p>
			<p style="padding-top:10px;width:100%;"> </p>
			<div id="container">
				<p style="padding:20px;">
					<!-- 按钮：禁用、启用 -->
					<input type="button" value="+ 批量启用" id="btnEnable" class="a-primary" style="border-radius:9px;"/>
					<input type="button" value="- 批量禁用" id="btnDisable" class="a-danger" style="border-radius:9px;"/>
					<span style="float:right;padding-right:20px;font-size:20px;">共有数据：${count}条</span>
				</p>
				<form id="usersFrm" method="post">
					<table class="tbUsers">
						<tr >
							<td id="myTd" class="tdCheck"><input type="checkbox" name="ckAll" id="ckAll"/>全选</td>
							<td id="myTd" class="tdUser">ID</td>
							<td id="myTd">用户名</td>
							<td id="myTd">最后登录时间</td>
							<td id="myTd">状态</td>
						</tr>
						
						<c:forEach var="users" items="${usersList}">
							<tr>
								<td><input type="checkbox" name="ck" id="ck "value="${users.id}"/></td>
								<td>${users.id}</td>
								<td>${users.userName }</td>
								<td><fmt:formatDate value="${users.lastLoginTime}" pattern="yyyy-MM-dd"/></td>
								<td class="tdIdRead">${users.isUsered=="1"?"启用":"禁用"}</td>
							</tr>
						</c:forEach>
					</table>
				</form>
				<div class="pager">
					<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="users_list?pageNum=${pageNum-1}" class="span-p2">
				    		<span>上一页</span>
				    	</a>			    	
			    	</c:if>
			    	<span class="span-p">第${ pageNum }页&nbsp;/&nbsp;共${pageCount}页</span>
			    	<c:if test="${ pageNum<pageCount }">
				    	<a href="users_list?pageNum=${pageNum+1}" class="span-p2">
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

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>messages_lists.jsp</title>

	<link href="css/messages_list.css" rel="stylesheet"/>
	<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
	<script>
		$(function(){
			$("#btnEnable").click(function(){
				if($("input[type='checkbox'][name='ck']:checked").length>0){
					$("#messagesFrm").attr("action","messages_enable");
					$("#messagesFrm").submit();
					alert("修改成功");
				}
				else{
					alert("请勾选审核对象");
				}
			});
			$("#btnDisable").click(function(){
				if($("input[type='checkbox'][name='ck']:checked").length>0){
					$("#messagesFrm").attr("action","messages_disable");
					$("#messagesFrm").submit();
					alert("修改成功");
				}
				else{
					alert("请勾选审核对象");
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
				<div id="operate" style="padding:20px;">
					<!-- 按钮：禁用、启用 -->
					<input type="button" value="+ 批量可读" id="btnEnable" class="a-primary" style="border-radius:9px;"/>
					<input type="button" value="- 批量禁止" id="btnDisable" class="a-danger" style="border-radius:9px;"/>
					<span style="float:right;padding-right:20px;font-size:20px;">共有审核通过数据：${count}条</span>
				</div>
				<form id="messagesFrm" method="post">
					<table class="tbMessages">
					<thead>
						<tr>
							<td id="myTd" class="tdCheck" ><input type="checkbox" name="ckAll" id="ckAll"/>全选</td>
							<td id="myTd" class="tdUser">姓名</td>
							<td id="myTd">联系电话</td>
							<td id="myTd" style="width:250px;">内容</td>
							<td id="myTd">email</td>
							<td id="myTd">时间</td>
							<td id="myTd">状态</td>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="messages" items="${messagesList}">
	    					<tr>
								<td><input type="checkbox" name="ck" id="ck" value="${messages.id}"/></td>
								<td>${messages.userName }</td>
								<td>${messages.phone }</td>
								<td>${messages.content }</td>
								<td>${messages.email }</td>
								<td><fmt:formatDate value="${messages.publishDate}" pattern="yyyy-MM-dd"/></td>
								<td class="tdIsRead">${messages.isRead=="1"?"可读":"不可读"}</td>
							</tr>
	    				</c:forEach>
	    				</tbody>
					</table>
				</form>
<%-- 				<div class="pager">
					<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="messages_list?pageNum=${pageNum-1}" class="span-p2">
				    		<span>上一页</span>
				    	</a>			    	
			    	</c:if>
			    	<span class="span-p">第${ pageNum }页&nbsp;/&nbsp;共${pageCount}页</span>
			    	<c:if test="${ pageNum<pageCount }">
				    	<a href="messages_list?pageNum=${pageNum+1}" class="span-p2">
							<span >下一页</span>
						</a>
			    	</c:if>
				</div> --%>
				<div class="pager">
			    	<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="messages_list?pageNum=${pageNum-1}" class="span-p2">
				    		<span>上一页</span>
				    	</a>			    	
			    	</c:if>
			    	<span class="span-p">第${ pageNum }页&nbsp;/&nbsp;共${pageCount}页</span>
			    	<c:if test="${ pageNum<pageCount }">
				    	<a href="messages_list?pageNum=${pageNum+1}" class="span-p2">
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

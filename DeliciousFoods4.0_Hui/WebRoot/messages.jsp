<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>messages.jsp</title>
		<link href="css/messages.css" rel="stylesheet"/>
		<script type="text/javascript" src="script/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="script/jquery.validate.js"></script>
		<script>
			$(function(){
				jQuery.validator.addMethod("isMobile",function(value,element){
					var pattern=/^(13[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/;
					return this.optional(element)||(value.length==11&&pattern.test(value));
				});
				$("#messagesForm").validate({
					rules:{"messages.userName":{required:true},
							"messages.userName":{required:true},
							"messages.phone":{required:true,isMobile:true},
							"messages.content":{required:true,rangelength:[5,300]}
					},
					messages:{"messages.userName":{required:"*请填写留言者名称！"},
								"messages.email":{required:"*email不能为空！"},
								"messages.phone":{required:"*手机号不能为空！",isMobile:"*请输入格式正确的11位手机号！"},
								"messages.content":{required:"*内容不能为空！",rangelength:"*输入5-300个字符"}
					}
				});
			});
		</script>
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

	    		<span class="title">用户留言：</span>
	    		<p></p>
	    		<div class="messageslist">
	    			<table class="taMessagesList">
	    				<c:forEach var="messages" items="${messagesList}">
	    					<c:if test="${messages.isRead==1 }">
				    			<tr>
	    							<td class="content">${messages.content}</td>
	    							<td class="content">${messages.userName}</td>
	    						</tr>		    	
				  		  	</c:if>
				  		  	
	    				</c:forEach>
	    			</table>
	    		</div>
			    <div class="pager">
			    	<!-- 页码 -->
			    	<c:if test="${ pageNum>1 }">
				    	<a href="messages?pageNum=${pageNum-1}">上一页</a>			    	
				    </c:if>
				    <c:if test="${ pageNum<pageCount }">
				    	<a href="messages?pageNum=${pageNum+1}">下一页</a>
				    </c:if>
			    	&nbsp;&nbsp;<span>共${pageCount}页，当前第${ pageNum }页</span>
			    </div>
	    	</div>
	    		    		<div class="container">
					<span class="title">留言板</span>
					<hr/>
					<form action="saveMessages" method="post" id="messagesForm">
						<table calss="tbMessage">
							<tr>
								<td>昵称：</td><td><input type="text" name="messages.userName"/></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>邮箱：</td><td><input type="text" name="messages.email" placeholder="wuxiqi@qq.com"/></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>电话：</td><td><input type="text" name="messages.phone" placeholder="13654322423"/></td>
								<td></td>
								<td></td><td>
							</tr>
							<tr>
								<td>内容：</td>
								<td colspan="4"><input type="text" name="messages.content" class="messagesContent"/></td>
								<td></td><td>
							</tr>
						</table>
						<button class="messagesButton">提交留言</button>
					</form>
	    		</div>
	    		<br/>
	    		<hr/>
	    	<div class="clear"></div>
	    	<!-- 页脚 -->
	    	<%@include  file="shared/footer.jsp"%>
		</div>
	</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="css/nav.css" rel="stylesheet"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="nav">
	<c:if test="${sessionScope.users==null }">
		<form action="doLogin" method="post">
		<table>
			<tr><td>用户：<input type="text" name="username" class="loginInput"></td></tr>
			<tr><td>密码：<input type="password" name="password" class="loginInput"></td></tr>
			
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="登录"/>
			&nbsp;&nbsp;&nbsp;<input type="button" value="注册" onclick="window.location='userJoin'"/>
			</td></tr>
		</table>
		<span>${message}</span>
		</form>
	</c:if>

	<hr />
	<p id="tag">工作时间</p>
	<div id="tagDetails">
		<p>周一到周五：08:00-17:00</p>
		<p>周六到周日：09:30-17:00</p>
	</div>
	<hr />
	<p id="tag">公司简介</p>
	<div id="tagDetails2">
		<p>这里是公司简介。简介内容百度随便找的。  Apache是世界使用排名第一的Web服务器软件。它可以运行在几乎所有广泛使用的计算机平台上，由于其跨平台和安全性被广泛使用，是最流行的Web服务器端软件之一。它快速、可靠并且可通过简单的API扩充，将Perl/Python等解释器编译到服务器中。同时Apache音译为阿帕奇，是北美印第安人的一个部落，叫阿帕奇族，在美国的西南部。也是一个基金会的名称、一种武装直升机等等。</p>
	</div>
</div>
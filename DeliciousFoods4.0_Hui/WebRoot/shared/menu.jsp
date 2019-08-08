<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8");%>
<link href="css/menu2.css" rel="stylesheet"/>
<div id="menu2">
	<div class="search">搜索</div>
	<div class="searchTitle">
		<form action="foodslist" method="get">
			<input type="hidden" name="cid" value="${cid}"/>
			<table>
				<tr>
					<td><input type="text" class="title" name="title"/></td>
					<td><input type="submit" value="查询"/></td>
				</tr>
			</table>
		</form>
		
	</div>
	
	<div class="category">
		<!-- 这里弄类别信息 -->
		<ul>
			<c:forEach var="category" items="${categories}">
				<li><a href="foodslist?cid=${ category.id }&title=${title}">${category.name}</a></li>
				
			</c:forEach>
		</ul>
	</div>
	<div class="onlineService">在线客服</div>
	<p></p>
	<a id="tagDetails"><span class="serachOnline">&nbsp;</span>在线客服一</a>
	<a id="tagDetails"><span class="serachOnline">&nbsp;</span>在线客服二</a>
	<hr/>
	<div classs="worktime">
		<p id="tag">工作时间</p>
		<div id="tagDetails">
			<p>周一到周五：08:00-17:00</p>
			<p>周六到周日：09:30-17:00</p>
		</div>
	</div>

</div>
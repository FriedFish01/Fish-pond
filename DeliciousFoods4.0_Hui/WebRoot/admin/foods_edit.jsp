<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>foods_edit.jsp</title>
<link href="css/foods_list.css" rel="stylesheet" />
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../script/jquery.validate.js"></script>
<script>
	$(function() {
		$("#foodsFrm").validate({
			rules : {
				"foods.chineseName" : {required : true},
				"foods.englishName" : {required : true}

			},
			messages : {
				"foods.chineseName" : {required : "*这是必填字段！"},
				"foods.englishName" : {required : "*这是必填字段！"}
			}
		});
	});

	function check() {
		//获取ckeditor中的文本
		var value = CKEDITOR.instances.content.getDate();
		var message = "";
		if (value == ""||value==null) {
			message = "制作流程/美食描述是必填字段！";
			$("#msg").html(message);
			return false;
		} else if (value.length < 12) {
			message = "至少输入12个字符";
			$("#msg").html(message);
			return false;
		} else {
			return true;
		}
	}

	$(function() {
		$("#foodsFrm").submit(function() {
			return check();
		});
	});
</script>
</head>
<body>
	<div id="page">
		<!-- 页眉 -->
		<%@ include file="shared/header.jsp"%>

		<!-- 主体 -->
		<div id=main>
			<%@ include file="shared/nav.jsp"%>
			<div id="container2">
				<p class="p1"></p>
				<p style="padding-top:10px;width:100%;"></p>
				<form action="foods_save" method="post" id="foodsFrm"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="${id}" /> <input
						type="hidden" name="foods.id" value="${foods.id}" />
					<table class="tbFood">
						<tr>
							<td>美食名称：</td>
							<td><input type="text" name="foods.chineseName"
								value="${foods.chineseName}" style="width:300px;height:25px;"/></td>
							<td><span class="clear"></span></td>
						</tr>
						<tr>
							<td>英文名称：</td>
							<td><input type="text" name="foods.englishName"
								value="${foods.englishName}" style="width:300px;height:25px;"/></td>
							<td></td>
						</tr>
						<tr>
							<td>图片：</td>
							<td><input type="file" id="foodsImage" name="foodsImage" />
							</td>
							<td></td>
						</tr>
						<tr>
							<td>菜系</td>
							<td>
								<select name="foods.categoryId" style="font-size:18px;text-align:center;width:120px;" >
										<c:forEach var="category" items="${categories}">
											<c:if test="${foods.categoryId==category.id}">
												<option value="${category.id}" selected="selected">${category.name}</option>
											</c:if>
											<c:if test="${foods.categoryId!=category.id}">
												<option value="${category.id}">${category.name}</option>
											</c:if>
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>制作流程</td>
							<td class="foodsDesc"><textarea name="foods.descriptioin"
									class="ckeditor" id="content" placeholder="2019-05-05">${foods.descriptioin}</textarea>
							</td>
							<td><span class="tip" id="msg">*</span></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="保存" /> <input type="button"
								value="取消" onclick="window.location='category_list'" />
							</td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="clear"></div>
		</div>

		<!-- 页脚 -->
		<%@include file="shared/footer.jsp"%>
	</div>
</body>
</html>
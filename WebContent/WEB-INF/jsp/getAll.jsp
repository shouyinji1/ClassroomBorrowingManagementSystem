<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${listUser}" var="list">
			<tr>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td><input type="button" value="修改" onClick="toUpd('${list.id}')"/></td>
			</tr>
		</c:forEach>
	</table>
	<script>
		function toUpd(id){
			location.href="getUserById?id="+id;
		}
	</script>
</body>
</html>
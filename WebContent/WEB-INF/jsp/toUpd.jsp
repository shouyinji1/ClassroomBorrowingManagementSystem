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
	<form action="updUser" method="post">
		<c:forEach items="${list}" var="list">
			<table>
				<tr>
					<td>
						序号：<input type="text" name="id" value="${list.id}" disabled="disabled" />
							<input type="hidden" name="id" value="${list.id}"/>
					</td>
				</tr>
				<tr>
					<td>
						姓名：<input type="text" name="name" value="${list.name}"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="提交" />
					</td>
				</tr>
			</table>
		</c:forEach>
	</form>
</body>
</html>
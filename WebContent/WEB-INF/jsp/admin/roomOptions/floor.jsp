<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
		<option selected="selected" value=''></option>
		<c:forEach items="${allFloor}" var="floor">
			<option value="${floor}">${floor}</option>
		</c:forEach>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
		<option selected="selected" value=''></option>
		<c:forEach items="${allRoom}" var="room">
			<option value="${room}">${room}</option>
		</c:forEach>
</body>
</html>
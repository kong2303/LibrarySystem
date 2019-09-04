<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	th {
		width : 200px;
		font-size : 20px;
	}
</style>
<body>
	<div>
		<table style="margin:left; text-align:center">
			<tr>
				<th><a href="<c:url value='/admin/bookStock'/>">도서현황</a></th>
				<th><a href="#">반납관리</a></th>
				<th><a href="#">회원관리</a></th>
			</tr>
		</table>
		<div style="text-align: right">
			${sessionScope.loginInfo.getMemberName() }님 환영합니다.<br>
			<a href="<c:url value='/login/logout'/>">로그아웃</a>
		</div>
	</div>
</body>
</html>
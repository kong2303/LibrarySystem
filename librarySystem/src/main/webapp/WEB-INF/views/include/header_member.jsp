<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th {
		width : 200px;
		font-size : 20px;
	}
</style>
</head>
<body>
	<div>
		<table style="margin:left; text-align:center">
			<tr>
				<th><a href="#">도서대출</a></th>
				<th><a href="#">도서반납</a></th>
				<th><a href="#">대여이력</a></th>
			</tr>
		</table>
		<div style="text-align: right">
			<a href="<c:url value='/member/myInfo'/>">${sessionScope.loginInfo.getMemberName() }</a>님 환영합니다.<br>
			<a href="<c:url value='/login/logout'/>">로그아웃</a>
		</div>
	</div>
</body>
</html>
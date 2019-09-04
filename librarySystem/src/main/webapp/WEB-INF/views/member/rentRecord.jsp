<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.loginInfo.getMemberId() == 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_admin.jsp"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.loginInfo.getMemberId() != 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_member.jsp"></jsp:include>
	</c:if>
	<hr>
	<h1 style="text-align: center">${sessionScope.loginInfo.getMemberId() }님의
		대여 이력</h1>
	<%
		int count = 1;
	%>
	<table border="1" style="text-align: center; margin: auto">
		<tr>
			<th>번호</th>
			<th>책 제목</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>수량</th>
			<th>상태</th>
		</tr>
		<c:forEach var="rent" items="${rentList }">
			<tr>
				<td><%=count%></td>
				<td>${rent.bookName }</td>
				<td>${rent.begin }</td>
				<td>${rent.end }</td>
				<td>${rent.stock }</td>
				<td>${(rent.state == 1)?"대여 중":"반납완료" }</td>
			</tr>
			<%
				count++;
			%>
		</c:forEach>
	</table>
	<div style="text-align: right">
		<input type="button" value="뒤로" onclick="history.back()">
	</div>
</body>
</html>
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
	<h1 style="text-align: center">대여중인 목록</h1>
	<form action="<c:url value='/member/returnBook'/>" name="rentList"
		method="post">
		<%
			int count = 1;
		%>
		<table border="1" style="text-align: center; margin: auto">
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>책 제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>수량</th>
			</tr>
			<c:forEach var="rent" items="${rentList }">
				<tr>
					<td><input type="checkbox" name="rNo" value="${rent.rNo }"></td>
					<td><%=count %></td>
					<td>${rent.bookName }</td>
					<td>${rent.begin }</td>
					<td>${rent.end }</td>
					<td>${rent.stock }</td>
				</tr>
				<% count++; %>
			</c:forEach>
		</table>
		<div style="text-align:right">
			<input type="submit" value="반납">
			<input type="button" value="뒤로" onclick="history.back()">
		</div>
	</form>
</body>
</html>
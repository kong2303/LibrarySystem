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
	<h1 style="text-align: center">대여중인 도서</h1>
	<table border="1" style="text-align: center; margin: auto">
		<%int count = 0; %>
		<c:forEach var="main" items="${mainList }">
			<%count++; %>
			<tr>
				<td rowspan="5" style="width:50px"><%=count %></td>
				<th rowspan="5"><img alt="이미지" width="160"
						src="${path }/resources/${main.image}"></th>
				<th>제목</th>
				<td style="width:200px">${main.bookName }</td>
			</tr>
			<tr>
				<th>작가</th>
				<td>${main.writer }</td>
			</tr>
			<tr>
				<th>시작일</th>
				<td>${main.begin }</td>
			</tr>
			<tr>
				<th>종료일</th>
				<td>${main.end }</td>
			</tr>
			<tr>
				<th>수량</th>
				<td>${main.stock }</td>
			</tr> 
		</c:forEach>
	</table>
</body>
</html>
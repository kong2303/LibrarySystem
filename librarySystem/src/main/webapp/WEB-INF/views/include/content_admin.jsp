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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">
<body>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h1 style="text-align: center">반납예정도서</h1>
		<table class="table table-bordered" style="text-align: center; margin: auto">
			<%
				int count = 0;
			%>
			<c:forEach var="main" items="${mainList }">
				<%
					count++;
				%>
				<tr>
					<td rowspan="6" style="width: 40px"><%=count%></td>
					<th rowspan="6" style="width: 200px"><img alt="이미지"
						width="200" src="${path }/resources/${main.image}"></th>
					<td>제목</td>
					<td>${main.bookName }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${main.memberId }</td>
				</tr>
				<tr>
					<td>작가</td>
					<td>${main.writer }</td>
				</tr>
				<tr>
					<td>시작일</td>
					<td>${main.begin }</td>
				</tr>
				<tr>
					<td>종료일</td>
					<td>${main.end }</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>${main.stock }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
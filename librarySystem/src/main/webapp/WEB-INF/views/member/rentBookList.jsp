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
	<c:if test="${sessionScope.loginInfo.getMemberId() == 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_admin.jsp"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.loginInfo.getMemberId() != 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_member.jsp"></jsp:include>
	</c:if>
	<hr>
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div style="text-align: center">
			<label style="font-size: 40px">대여중인 목록</label> <br>
			<br>
			<form action="<c:url value='/member/returnBook'/>" name="rentList"
				method="post">
				<%
					int count = 1;
				%>
				<table class="table table-bordered" style="text-align: center; margin: auto">
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
							<td><%=count%></td>
							<td>${rent.bookName }</td>
							<td>${rent.begin }</td>
							<td>${rent.end }</td>
							<td>${rent.stock }</td>
						</tr>
						<%
							count++;
						%>
					</c:forEach>
				</table>
				<div style="text-align: right">
					<br><br>
					<input type="submit" value="반납" class="btn btn-primary"> 
					<input type="button" value="뒤로" onclick="history.back()" class="btn btn-default">
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-3"></div>

</body>
</html>
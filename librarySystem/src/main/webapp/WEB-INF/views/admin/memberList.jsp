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
			<label style="font-size: 40px">회원 목록</label>
		</div>
		<%
			int count = 1;
		%>
		<table class="table table-bordered" style="text-align: center; margin: auto">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>비고</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td><%=count%></td>
					<td>${member.memberId }</td>
					<td>${member.memberName }</td>
					<td>${member.email }</td>
					<td><a
						href="<c:url value='/member/rentRecord?memberId=${member.memberId }'/>">대여이력
							확인</a></td>
				</tr>
				<%
					count++;
				%>
			</c:forEach>
		</table>
		<div style="text-align: right">
			<input type="button" value="뒤로" onclick="history.back()" class="btn btn-default">
		</div>
	</div>
	<div class="col-md-3"></div>
</body>
</html>
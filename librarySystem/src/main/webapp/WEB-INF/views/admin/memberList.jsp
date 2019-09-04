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
	<h1 style="text-align: center">회원 목록</h1>
	<%
		int count = 1;
	%>
	<table border="1" style="text-align: center; margin: auto">
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
				<td>
					<a href="<c:url value='/member/rentRecord?memberId=${member.memberId }'/>">대여이력 확인</a>
				</td>
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
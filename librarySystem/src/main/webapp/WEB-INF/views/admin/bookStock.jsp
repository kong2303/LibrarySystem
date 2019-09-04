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
	<h1 style="text-align: center">도서 현황</h1>
	<div  style="text-align: right">
		<a href="<c:url value='/admin/insertBook'/>">도서추가</a>
	</div>
	
	<table border="1" style="text-align: center; margin: auto">
		<c:forEach var="book" items="${bookList }">
			<tr>
				<td rowspan="4"><a href="#"><img alt="이미지" width="160"
						src="${path }/resources/${book.image}"></a></td>
				<td colspan="2"><a href="#">${book.bookName }</a></td>
			</tr>
			<tr>
				<td colspan="2">${book.writer }</td>
			</tr>
			<tr>
				<td colspan="2">${book.publish }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${book.stock }</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
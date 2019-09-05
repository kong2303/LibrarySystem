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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">
<body>
	<c:if test="${sessionScope.loginInfo.getMemberId() == 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_admin.jsp"></jsp:include>
		<c:set var="detail" value="/admin/detailBook"/>
	</c:if>
	<c:if test="${sessionScope.loginInfo.getMemberId() != 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_member.jsp"></jsp:include>
		<c:set var="detail" value="/member/applyRent"/>
	</c:if>
	<hr>
	<div class="col-md-4"></div>
	<div class="col-md-4">
	<c:if test="${sessionScope.loginInfo.getMemberId() != 'admin' }">
		<div style="text-align: center">
			<label style="font-size: 40px">도서 목록</label>
		</div>
	</c:if>
	<c:if test="${sessionScope.loginInfo.getMemberId() == 'admin' }">
		<div style="text-align: center">
			<label style="font-size: 40px">도서 현황</label>
		</div>
		<div  style="text-align: right">
			<a href="<c:url value='/admin/insertBook'/>" class="btn btn-default">도서추가</a>
		</div>
	</c:if>
	
	<table class="table table-bordered" style="text-align: center; margin: auto">
		<c:forEach var="book" items="${bookList }">
			<tr>
				<td rowspan="4"><a href="<c:url value='${detail }?bookNo=${book.bookNo }'/>"><img alt="이미지" width="160"
						src="${path }/resources/${book.image}"></a></td>
				<td colspan="2"><a href="<c:url value='${detail }?bookNo=${book.bookNo }'/>">${book.bookName }</a></td>
			</tr>
			<tr>
				<td colspan="2">${book.writer }</td>
			</tr>
			<tr>
				<td colspan="2">${book.publish }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>
					${book.stock } (${(book.stock == 0)?"대여불가":"대여가능" })
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
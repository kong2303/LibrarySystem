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

<script type="text/javascript">
	function check(){
		if(document.updateBookForm.stock.value == 0){
			alert('1개 이상 선택해주세요.');
			return false;
		} else if(!document.updateBookForm.begin.value){
			alert('대여시작일을 선택해주세요.');
			return false;
		} else if(!document.updateBookForm.end.value){
			alert('대여종료일을 선택해주세요.');
			return false;
		} 
	}
</script>

<body>
	<c:if test="${sessionScope.loginInfo.getMemberId() == 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_admin.jsp"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.loginInfo.getMemberId() != 'admin' }">
		<jsp:include page="/WEB-INF/views/include/header_member.jsp"></jsp:include>
	</c:if>
	<hr>
	<h1 style="text-align: center">도서 대여</h1>
	<form action="<c:url value='/member/applyRentPro'/>" name="updateBookForm" method="post" onsubmit="return check();">
		<input type="hidden" name="bookNo" value="${book.bookNo }">
		<input type="hidden" name="memberId" value="${sessionScope.loginInfo.getMemberId() }">
		<table border="1" style="text-align: center; margin: auto">
			<tr>
				<td rowspan="6"><img alt="이미지" width="160"
					src="${path }/resources/${book.image}"></td>
				<td>도서 제목</td>
				<td>${book.bookName }</td>
			</tr>
			<tr>
				<td>저자</td>
				<td>${book.writer }</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td>${book.publish }</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" name="stock" value="0" min="0" max="${book.stock }" maxlength="3" ></td>
			</tr>
			<tr>
				<td>시작일</td>
				<td><input type="date" name="begin"></td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><input type="date" name="end"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: right">
					<input type="submit" value="대여">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
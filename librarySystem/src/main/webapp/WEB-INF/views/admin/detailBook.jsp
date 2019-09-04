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
	function checkContent(){
		if(!document.updateBookForm.bookName.value){
			alert('도서 제목을 입력하세요.');
			return false;
		} else if(!document.updateBookForm.writer.value){
			alert('저자를 입력하세요.');
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
	<h1 style="text-align: center">도서 수정</h1>
	<form action="<c:url value='/admin/updateBook'/>" name="updateBookForm" method="post" onsubmit="return checkContent();">
		<input type="hidden" name="bookNo" value="${book.bookNo }">
		<input type="hidden" name="image" value="${book.image }">
		<table border="1" style="text-align: center; margin: auto">
			<tr>
				<td rowspan="4"><img alt="이미지" width="160"
					src="${path }/resources/${book.image}"></td>
				<td>도서 제목</td>
				<td><input type="text" name="bookName" value="${book.bookName }"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="writer" value="${book.writer }"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publish" value="${book.publish }"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" name="stock" value="${book.stock }" min="0"></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
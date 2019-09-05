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
	function checkContent() {
		if (!document.updateBookForm.bookName.value) {
			alert('도서 제목을 입력하세요.');
			return false;
		} else if (!document.updateBookForm.writer.value) {
			alert('저자를 입력하세요.');
			return false;
		}
	}
</script>
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
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<label style="font-size: 40px">도서 수정</label>
		<form action="<c:url value='/admin/updateBook'/>"
			name="updateBookForm" method="post" onsubmit="return checkContent();">
			<input type="hidden" name="bookNo" value="${book.bookNo }"> <input
				type="hidden" name="image" value="${book.image }">
			<table class="table table-bordered"
				style="text-align: center; margin: auto">
				<tr>
					<td rowspan="4"><img alt="이미지" width="160"
						src="${path }/resources/${book.image}"></td>
					<td>도서 제목</td>
					<td><input type="text" name="bookName"
						value="${book.bookName }" class="form-control"></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="writer" value="${book.writer }" class="form-control"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publish" value="${book.publish }" class="form-control"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="number" name="stock" value="${book.stock }"
						min="0" class="form-control"></td>
				</tr>
			</table>
			<div style="text-align: right">
				<input type="submit" value="수정" class="btn btn-primary"> <input
					type="button" value="취소" onclick="history.back()"
					class="btn btn-default">
			</div>
		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
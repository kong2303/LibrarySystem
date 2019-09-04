<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createMember</title>
</head>
<script type="text/javascript">
	function checkContent(){
		if(!document.insertBookForm.bookName.value){
			alert('도서 제목을 입력하세요.');
			return false;
		} else if(!document.insertBookForm.writer.value){
			alert('저자를 입력하세요.');
			return false;
		} else if(!document.insertBookForm.uploadfile.value){
			alert('도서 이미지를 선택하세요.');
			return false;
		} else if(!document.insertBookForm.stock.value){
			document.insertBookForm.stock.value = 0;
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
	<div style="text-align:center">
		<h1>도서추가</h1>
	</div>
	
	<form name="insertBookForm" action="<c:url value='/admin/insertBookPro'/>" method="post" 
	onsubmit="return checkContent()" enctype="multipart/form-data"
	accept-charset="UTF-8">
		<input type="hidden" name="bookNo" value="0">
		<input type="hidden" name="image" value="0">
		<table border="1" style="margin:auto; text-align:left">
			<tr>
				<th>이미지 : </th>
				<td>
					<input type="file" name="uploadfile">
				</td>
			</tr>
			<tr>
				<th>도서 제목 : </th>
				<td><input type="text" name="bookName"></td>
			</tr>
			<tr>
				<th>저자 : </th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>출판사 : </th>
				<td><input type="text" name="publish"></td>
			</tr>
			<tr>
				<th>재고 : </th>
				<td><input type="number" name="stock" min="0"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right">
					<input type="submit" value="확인">
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
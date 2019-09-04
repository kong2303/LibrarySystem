<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
</head>
<script type="text/javascript">
	
	function pwCheck(){
		if(!document.infoCheckForm.pw.value){
			alert('비밀번호를 입력하세요.');
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
	<form action="<c:url value='/member/myInfoCheck'/>" name="infoCheckForm" onsubmit="return pwCheck();">
		<input type="hidden" name="id" value="${sessionScope.loginInfo.getMemberId() }">
		<table style="margin: auto; text-align: center">
			<tr>
				<th>
					개인정보보호를 위해<br>
					비밀번호를<br>
					입력해주세요.
				</th>
			</tr>
			<tr>
				<td style="height:100px">
					<input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
					<input type="submit" value="확인">
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form> 
</body>
</html>
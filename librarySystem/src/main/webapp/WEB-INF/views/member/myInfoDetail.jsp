<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainPage</title>
</head>
<script type="text/javascript">
	function checkContent() {
		if (!document.createMemberForm.password.value) {
			alert('비밀번호를 입력하세요.');
			return false;
		} else if (!document.createMemberForm.re_password.value) {
			alert('비밀번호 확인을 입력하세요.');
			return false;
		} else if (document.createMemberForm.password.value != document.createMemberForm.re_password.value) {
			alert('비밀번호 확인이 일치하지 않습니다.');
			return false;
		} else if (!document.createMemberForm.memberName.value) {
			alert('이름을 입력하세요.');
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
	<c:if test="${result != 0 }">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다.');
			history.back();
		</script>
	</c:if>
	<form action="<c:url value='/member/myInfoUpdate'/>"
		name="infoCheckForm" onsubmit="return checkContent();">
		<input type="hidden" name="dup" id="dup" value="1">
		<table style="margin: auto; text-align: left">
			<tr>
				<th colspan="2" style="height: 100px">개인정보 확인 및 수정</th>
			</tr>
			<tr>
				<th>아이디 :</th>
				<td><input type="text" name="memberId" id="memberId"
					maxlength="15" value="${sessionScope.loginInfo.getMemberId() }"
					readonly></td>
			</tr>
			<tr>
				<th>비밀번호 :</th>
				<td><input type="password" name="password" maxlength="15"></td>
			</tr>
			<tr>
				<th>비밀번호 확인:</th>
				<td><input type="password" name="re_password" maxlength="15"></td>
			</tr>
			<tr>
				<th>이름 :</th>
				<td><input type="text" name="memberName" maxlength="10"
					value="${sessionScope.loginInfo.getMemberName()}"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email1"
					value="${sessionScope.loginInfo.getEmail().split('@')[0]}">
					@ <input type="text" name="email2"
					value="${sessionScope.loginInfo.getEmail().split('@')[1]}">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: right">
				<input type="submit" value="확인">
                <input type="button" value="뒤로" onclick="history.back();"></td>
			</tr>
		</table>
	</form>
</body>
</html>
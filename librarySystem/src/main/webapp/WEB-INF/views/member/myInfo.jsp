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
	function pwCheck() {
		if (!document.infoCheckForm.pw.value) {
			alert('비밀번호를 입력하세요.');
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
		<form action="<c:url value='/member/myInfoCheck'/>" class="form-horizontal"
			name="infoCheckForm" onsubmit="return pwCheck();">
			<input type="hidden" name="id" value="${sessionScope.loginInfo.getMemberId() }">
			<div class="form-group" style="text-align:center">
				<label>개인정보보호를 위해 비밀번호를 입력해주세요.</label>
			</div>
			<div class="form-group">
				<label for="pw" class="col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-6">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." class="form-control">
				</div>
				<div class="col-sm-3">
					<input type="submit" value="확인" class="btn btn-primary">
					<input type="button" value="뒤로" onclick="history.back();" class="btn btn-default">
				</div>
			</div>
		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
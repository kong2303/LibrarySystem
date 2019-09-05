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
	<c:if test="${result != 0 }">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다.');
			history.back();
		</script>
	</c:if>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div style="text-align: center">
			<label style="font-size: 40px">개인정보 확인 및 수정</label>
		</div>
		
		<form action="<c:url value='/member/myInfoUpdate'/>" name="infoCheckForm" onsubmit="return checkContent();" class="form-horizontal">
			<div class="form-group">
				<label for="memberId" class="col-sm-3 control-label">아이디</label>
				<div class="col-sm-9">
					<input type="text" name="memberId" id="memberId"
					maxlength="15" value="${sessionScope.loginInfo.getMemberId() }"
					readonly class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" name="password" id="password" maxlength="15" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="re_password" class="col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" name="re_password" id="re_password" maxlength="15" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="memberName" class="col-sm-3 control-label">이름</label>
				<div class="col-sm-9">
					<input type="text" name="memberName" id="memberName" maxlength="10" value="${sessionScope.loginInfo.getMemberName()}" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="email1" class="col-sm-3 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" name="email1" id="email1" class="form-control" value="${sessionScope.loginInfo.getEmail().split('@')[0]}">
				</div>
				<div class="col-sm-1">
					@
				</div>
				<div class="col-sm-4">
					<input type="text" name="email2" id="email2" class="form-control" value="${sessionScope.loginInfo.getEmail().split('@')[1]}">
				</div>
			</div>
			<div style="text-align:right">
				<input type="submit" value="수정" class="btn btn-primary">
				<input type="button" value="취소" onclick="location.href='<c:url value='/member/main'/>'" class="btn btn-default">
			</div>
			
		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
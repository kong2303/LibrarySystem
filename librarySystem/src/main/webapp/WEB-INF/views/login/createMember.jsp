<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createMember</title>
</head>
<script type="text/javascript">
	function checkContent() {
		if (!document.createMemberForm.memberId.value) {
			alert('아이디를 입력하세요.');
			return false;
		} else if (document.createMemberForm.dup.value == 0) {
			alert('아이디 중복확인이 필요합니다.');
			return false;
		} else if (!document.createMemberForm.password.value) {
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

	function checkDup() {
		var memberid = document.createMemberForm.memberId.value;
		if (!memberid) {
			alert('아이디를 입력하세요.');
			return false;
		}
		window.open("<c:url value='/login/checkDup?memberId=" + memberid
				+ "'/>", '아이디 중복확인', 'width=800px, height=400px');
	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">
<body>

	<div style="text-align: center">
		<label style="font-size: 40px">회원가입</label>
	</div>
	<hr>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form name="createMemberForm" action="createPro" method="post"
			onsubmit="return checkContent();" class="form-horizontal">
			<input type="hidden" name="dup" id="dup" value="0">
			
			<div class="form-group">
				<label for="memberId" class="col-sm-3 control-label">아이디</label>
				<div class="col-sm-7">
					<input type="text" name="memberId" id="memberId" maxlength="15" class="form-control">
				</div>
				<div class="col-sm-2">
					<input type="button" value="중복확인"	onclick="checkDup();" class="btn btn-default">
				</div>
			</div>
			
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" name="password" id="password" maxlength="15" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="re_password" class="col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-9">
					<input type="password" name="re_password" id="re_password" maxlength="15" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="memberName" class="col-sm-3 control-label">이름</label>
				<div class="col-sm-9">
					<input type="text" name="memberName" id="memberName" maxlength="10" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="email1" class="col-sm-3 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" name="email1" id="email1" class="form-control">
				</div>
				<div class="col-sm-1">
					@
				</div>
				<div class="col-sm-4">
					<input type="text" name="email2" id="email2" class="form-control">
				</div>
			</div>
			<div style="text-align:right">
				<input type="submit" value="회원가입" class="btn btn-primary">
				<input type="button" value="뒤로" onclick="history.back();" class="btn btn-default">
			</div>
			<!-- <table border="1" style="margin: auto; text-align: left">
				<tr>
					<th>아이디 :</th>
					<td><input type="text" name="memberId" id="memberId"
						maxlength="15"> <input type="button" value="중복확인"
						onclick="checkDup();"></td>
				</tr>
				<tr>
					<th>비밀번호 :</th>
					<td><input type="password" name="password" id="password" maxlength="15"></td>
				</tr>
				<tr>
					<th>비밀번호 확인:</th>
					<td><input type="password" name="re_password" maxlength="15"></td>
				</tr>
				<tr>
					<th>이름 :</th>
					<td><input type="text" name="memberName" maxlength="10"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email1"> @ <input
						type="text" name="email2"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right"><input type="submit"
						value="확인"> <input type="button" value="뒤로"
						onclick="history.back();"></td>
				</tr>
			</table> -->
		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
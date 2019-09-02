<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createMember</title>
</head>
<body>

	<div style="text-align:center">
		<h1>회원가입</h1>
	</div>
	<div style="text-align:right">
	</div>
	<hr>
	<form name="createMemberForm" action="createPro" method="post">
		<table border="1" style="margin:auto; text-align:left">
			<tr>
				<th>아이디 : </th>
				<td>
					<input type="text" name="memberId" maxlength="15">
					<input type="button" value="중복확인" onclick="checkDup();">
				</td>
			</tr>
			<tr>
				<th>비밀번호 : </th>
				<td><input type="password" name="password" maxlength="15"></td>
			</tr>
			<tr>
				<th>비밀번호 확인: </th>
				<td><input type="password" name="re_password" maxlength="15"></td>
			</tr>
			<tr>
				<th>이름 : </th>
				<td><input type="text" name="memberName" maxlength="10"></td>
			</tr>
			<tr>
				<th>E-mail </th>
				<td>
					<input type="text" name="email1">
					@<input type="text" name="email2">
				</td>
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
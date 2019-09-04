<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
</head>
	<script type="text/javascript">
		function check(){
			if(!document.loginForm.id.value){
				alert('아이디를 입력하세요');
				return false;
			} else if(!document.loginForm.pw.value){
				alert('비밀번호를 입력하세요.');
				return false;
			}
		}
	</script>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String memberId = "";
		if(request.getParameter("memberId") != null){
			memberId = request.getParameter("memberId");
		}
		String result = "";
		if(request.getParameter("result") != null){
			result = request.getParameter("result");
		}
	%>
	
	<c:set var="result" value="<%=result %>"></c:set>
	<c:set var="memberId" value="<%=memberId %>"></c:set>
	<div style="text-align: center">
		<h1>LOGIN</h1>
	</div>
	<hr>
	<div>
		<form name="loginForm" action="<c:url value='/login/loginPro'/>" method="post"
			onsubmit = "return check();">
			<table border="1" style="margin: auto; text-align: center">
				<tr>
					<th colspan="4">로그인 페이지
						<c:if test="${result.equals('1') }">
							<br> <div style="color:red;">아이디가 존재하지 않습니다.</div>
						</c:if>
						<c:if test="${result.equals('2') }">
							<br> <div style="color:red;">비밀번호가 일치하지 않습니다.</div>
						</c:if>
						<c:if test="${result.equals('3') }">
							<br> <div style="color:blue;">회원가입을 축하합니다!!</div>
						</c:if>
					</th>
				</tr>
				<tr>
					<th style="width: 30%">아이디 :</th>
					<c:if test="${memberId.length() != 0 }">
						<td colspan="3"><input type="text" name="id" value="${memberId }"
						placeholder="아이디를 입력하세요."></td>
					</c:if>
					<c:if test="${memberId.length() == 0 }">
						<td colspan="3"><input type="text" name="id"
						placeholder="아이디를 입력하세요."></td>
					</c:if>
					
				</tr>
				<tr>
					<th style="width: 30%">비밀번호 :</th>
					<td colspan="3"><input type="password" name="pw"
						placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td colspan="2" style="width: 50%"><input type="submit"
						value="로그인"></td>
					<td colspan="2" style="width: 50%"><input type="button"
						value="회원가입" onclick="location.href='<c:url value='/login/createMember'/>';">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
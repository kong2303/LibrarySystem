<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">

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
		<label style="font-size:40px">도서관</label>
	</div>
	<hr>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form name="loginForm" action="<c:url value='/login/loginPro'/>" method="post"
			onsubmit = "return check();">
			
			<div class="form-group" style="text-align:center">
				<label style="font-size:30px">로그인페이지</label>
			</div>
			<div class="form-group">
				<label for="id">아이디</label>
				<c:if test="${memberId.length() != 0 }">
					<input type="text" name="id" id="id" value="${memberId }" placeholder="아이디를 입력하세요." class="form-control">
				</c:if>
				<c:if test="${memberId.length() == 0 }">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요." class="form-control">
				</c:if>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." class="form-control">
			</div>
			<div class="form-group">
				<c:if test="${result.equals('1') }">
					<label style="color: red;">아이디가 존재하지 않습니다.</label>
				</c:if>
				<c:if test="${result.equals('2') }">
					<label style="color: red;">비밀번호가 일치하지 않습니다.</label>
				</c:if>
				<c:if test="${result.equals('3') }">
					<label style="color: blue;">회원가입을 축하합니다!!</label>
				</c:if>
			</div>
			<div style="text-align:right">
				<input type="submit" value="로그인" class="btn btn-primary">
				<input type="button" value="회원가입" onclick="location.href='<c:url value='/login/createMember'/>';" class="btn btn-default">
			</div>
		</form>
	</div>
	<div class="col-md-4"></div>
</body>
</html>
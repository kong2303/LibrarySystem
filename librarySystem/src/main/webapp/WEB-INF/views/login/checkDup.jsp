<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function dupConfirm(){
		window.opener.document.getElementById('dup').value = 1;
		window.opener.document.getElementById('memberId').value = '${memberId}';
		self.close();
	}
	
	function checkId(){
		if(!document.dupForm.memberId.value){
			alert('아이디를 입력하세요.');
			return false;
		}
	}
</script>
<body>
	<div style="text-align:center">
		<h2>중복확인 결과</h2>
	</div>
	<hr>
	<form name="dupForm" action="<c:url value='/login/checkDup'/>" onsubmit="return checkId();">
		<input type="text" name="memberId" value="${memberId }">
		<input type="submit" value="확인">
		<c:if test="${result == 1 }">
			<h4>${memberId }</h4>사용할 수 없는 아이디입니다. 다시 확인해주세요.<br>
		</c:if>
		<c:if test="${result == 0 }">
			<h4>${memberId }</h4>사용할 수 있는 아이디입니다.<br>
			<input type="button" value="사용하기" onclick="return dupConfirm();">
		</c:if>
		<input type="button" value="닫기" onclick="self.close();">
	</form>
</body>
</html>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">
<body>
	<div style="text-align: center">
		<label style="font-size:40px">중복확인 결과</label>
	</div>
	<hr>
	<form name="dupForm" action="<c:url value='/login/checkDup'/>" onsubmit="return checkId();" class="form-horizontal">
		<div class="form-group">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<input type="text" name="memberId" value="${memberId }" class="form-control">
			</div>
			<div class="col-sm-2">
				<input type="submit" value="확인" class="btn btn-default">
			</div>
			<div class="col-sm-1"></div>
		</div>
		<c:if test="${result == 1 }">
			<div class="form-group">
				<div class="col-sm-3"></div>
				<div>
					<label style="color: red;">${memberId }</label>
					<label>사용할 수 없는 아이디입니다. 다시 확인해주세요.</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8"></div>
				<div>
					<input type="button" value="닫기" onclick="self.close();" class="btn btn-default">
				</div>
			</div>
		</c:if>
		<c:if test="${result == 0 }">
			<div class="form-group">
				<div class="col-sm-3"></div>
				<div>
					<label style="color: blue;">${memberId }</label>
					<label>사용할 수 있는 아이디입니다.</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8"></div>
				<div>
					<input type="button" value="사용하기" onclick="return dupConfirm();" class="btn btn-primary">
					<input type="button" value="닫기" onclick="self.close();" class="btn btn-default">
				</div>
			</div>
		</c:if>
	</form>
</body>
</html>
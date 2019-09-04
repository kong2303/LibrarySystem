<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createPro</title>
</head>
<body>

	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert('회원가입에 실패했습니다. 다시 시도하세요');
			history.back();
		</script>
	</c:if>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			location.href = "<c:url value='/login/loginPage?result=${result+2}&memberId=${memberId}'/>";
		</script>
	</c:if>
	
</body>
</html>
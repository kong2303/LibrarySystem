<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hanwha.dto.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>

	<c:if test="${result == 0 }">
		<%
			request.setCharacterEncoding("UTF-8");
			MemberDTO memberInfo = (MemberDTO)request.getAttribute("memberInfo");
			session.setAttribute("loginInfo", memberInfo);
		%>
		<script type="text/javascript">
			location.href = "<c:url value='/member/main'/>";
		</script>
	</c:if>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			location.href = "<c:url value='/login/loginPage?result=${result}'/>";
		</script>
	</c:if>
	<c:if test="${result == 2 }">
		<script type="text/javascript">
			location.href = "<c:url value='/login/loginPage?result=${result}&memberId=${memberId}'/>";
		</script>
	</c:if>
	

</body>
</html>
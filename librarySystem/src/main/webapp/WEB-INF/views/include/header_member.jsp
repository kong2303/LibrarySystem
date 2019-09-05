<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	width: 200px;
	font-size: 20px;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="../resources/css/bootstrap.css">
<body>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="form-group">
			<ul class="list-inline">
				<li><a href="<c:url value='/member/main'/>"
					class="btn btn-link">메인으로</a></li>
				<li><a href="<c:url value='/admin/bookStock'/>"
					class="btn btn-link">도서대출</a></li>
				<li><a
					href="<c:url value='/member/rentBookList?memberId=${sessionScope.loginInfo.getMemberId() }'/>"
					class="btn btn-link">도서반납</a></li>
				<li><a
					href="<c:url value='/member/rentRecord?memberId=${sessionScope.loginInfo.getMemberId() }'/>"
					class="btn btn-link">대여이력</a></li>
			</ul>
			<div style="text-align: right">
				<a href="<c:url value='/member/myInfo'/>" class="btn btn-link">${sessionScope.loginInfo.getMemberName() }</a>님
				환영합니다.<br> <a href="<c:url value='/login/logout'/>"
					class="btn btn-link">로그아웃</a>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>

</body>
</html>
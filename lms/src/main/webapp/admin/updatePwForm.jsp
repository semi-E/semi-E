<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>     
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<form method="post" action="/lms/admin/updatePwAction.jsp">
			<div>
				예전 비밀번호: <input type="password" name = "oldPw">
			</div>
			<div>
				새 비밀번호: <input type="password" name = "newPw">
			</div>
			<!-- 테스트용 -->
			
			<button type="submit">제출</button>
		</form>
		<a href="/lms/admin/updatePwForm.jsp">비밀번호 변경</a>
	
	</div>
	
</body>
</html>
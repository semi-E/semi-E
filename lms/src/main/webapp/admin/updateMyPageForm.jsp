<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

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
<title>내 정보 수정</title>
</head>
<body>
	<form action="/lms/admin/updateMyPageAction.jsp" method="post">
		<div>
			이메일: <input type="email" name = "email">
		</div>
		<div>
			핸드폰 번호: <input type="text" name = "phone">
		</div>
		<div>
			주소: <input type="text" name = "address">
		</div>
		<div>
			성별: <input type="text" name = "gender">
		</div>
		<div>
			생일: <input type="text" name = "birthday">
		</div>
		<button type="submit">수정</button>
	</form>
</body>
</html>
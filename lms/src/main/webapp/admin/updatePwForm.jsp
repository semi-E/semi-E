<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<form method="post" action="/lms/admin/updatePwAction.jsp">
		<div>
			예전 비밀번호: <input type="text" name = "oldPw">
		</div>
		<div>
			새 비밀번호: <input type="text" name = "newPw">
		</div>
		<!-- 테스트용 -->
		<div>
			어드민 번호: <input type="text" name = "adminNo">
		</div>
		<button type="submit">제출</button>
	</form>
</body>
</html>
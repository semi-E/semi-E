<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/professor/include/header.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/professor/include/myPageSidebar.jsp"></jsp:include>
			<h1>비밀번호 변경</h1>
			<form method="post" action="/lms/professor/updatePwAction.jsp">
				비밀번호 : <input type="password" name="oldPw"><br>
				새 비밀번호 : <input type="password" name="newPw"><br>
				<button type="submit">변경</button>
			</form>
		</div>
	</div>
</body>
</html>
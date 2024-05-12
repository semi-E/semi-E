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
	<h1>교수 메인</h1>
	<a href="/lms/professor/myPage.jsp">마이 페이지</a>
	<a href="/lms/professor/class/myClassList.jsp">강의</a>
</body>
</html>
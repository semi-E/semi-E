<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/admin/main.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/student/main.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/professor/main.jsp");
		return;
	}
%>
<%
	//session.removeAttribute("loginEmp");	


	System.out.println(session.getId()+"<--logout.jsp+session.getId");
	session.invalidate(); // 세션공간을 초기화 하였다.(포맷))

	response.sendRedirect("/lms/loginForm.jsp");
 %>




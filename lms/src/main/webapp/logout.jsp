<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) { //로그인에 실패하였을때
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) { //로그인에 실패하였을때
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) { //로그인에 실패하였을때
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	//session.removeAttribute("loginEmp");	


	System.out.println(session.getId()+"<--logout.jsp+session.getId");
	session.invalidate(); // 세션공간을 초기화 (포맷))

	response.sendRedirect("/lms/loginForm.jsp");
 %>




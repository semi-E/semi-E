<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	//session에 값이 하나라도 없으면 로그아웃
	if (session.getAttribute("loginAdmin") == null &&
	session.getAttribute("loginStudent") == null &&
	session.getAttribute("loginProfessor") == null) {
	response.sendRedirect("/lms/loginForm.jsp");
	return;
	}
%>
<%
	System.out.println(session.getId()+"<--logout.jsp+session.getId");
	session.invalidate(); // 세션공간을 초기화 (포맷))
	response.sendRedirect("/lms/loginForm.jsp");
 %>




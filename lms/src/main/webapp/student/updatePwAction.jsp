<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>        
<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>       
    
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	HashMap<String, Object> m = StudentDAO.selectStudent(studentNo);

	String oldpw = request.getParameter("oldpw");
	String newpw = request.getParameter("newpw");
	
	System.out.println(studentNo+"<----studentNo");
	System.out.println(oldpw+"<----oldpw");
	System.out.println(newpw+"<----newpw");
	
%>      

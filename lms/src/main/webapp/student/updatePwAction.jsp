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
	

	String oldpw = request.getParameter("oldpw");
	String newpw = request.getParameter("newpw");
	System.out.println(studentNo+"<----studentNo");
	System.out.println(oldpw+"<----oldpw");
	System.out.println(newpw+"<----newpw");
	
	int row = StudentDAO.insertPw(studentNo, oldpw, newpw);
	
	if(row == 1){
		System.out.println("비밀번호 변경 완료");
		response.sendRedirect("/lms/student/myPage.jsp");
	} else {
		System.out.println("비밀번호 변경 실패");
		response.sendRedirect("/lms/student/updatePwForm.jsp");
	}
	
	
%>      

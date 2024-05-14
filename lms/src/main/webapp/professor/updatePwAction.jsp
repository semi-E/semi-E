<%@page import="lms.dao.ProfessorPwHistoryDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	
	System.out.println(oldPw + "<-- updatePwAction param oldPw");
	System.out.println(newPw + "<-- updatePwAction param newPw");
	System.out.println(professorNo + "<-- updatePwAction session professorNo");
	
	int row = ProfessorPwHistoryDAO.insertProfessorPwHistory(professorNo, oldPw, newPw);
	if(row == 1){
		System.out.println("교수 비밀번호 수정 성공");
		response.sendRedirect("/lms/professor/myPage.jsp");
	} else {
		System.out.println("교수 비밀번호 수정 실패");
		response.sendRedirect("/lms/professor/updatePwForm.jsp");
	}
%>
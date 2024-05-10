<%@page import="lms.dao.Professor_Pw_History"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	int professorNo = 220241001; //세션
	
	System.out.println(oldPw + "<-- updatePwAction param oldPw");
	System.out.println(newPw + "<-- updatePwAction param newPw");
	System.out.println(professorNo + "<-- updatePwAction session professorNo");
	
	int row = Professor_Pw_History.insertProfessorPwHistory(professorNo, oldPw, newPw);
	if(row == 1){
		System.out.println("교수 비밀번호 수정 성공");
		response.sendRedirect("/lms/professor/myPage.jsp");
	} else {
		System.out.println("교수 비밀번호 수정 실패");
		response.sendRedirect("/lms/professor/updatePwForm.jsp");
	}
%>
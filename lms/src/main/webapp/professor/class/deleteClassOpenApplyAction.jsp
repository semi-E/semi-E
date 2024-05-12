<%@page import="lms.dao.ClassOpenApplyDAO"%>
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
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	//디버깅 
	System.out.println(professorNo + "<-- deleteClassOpenApplyAction session professorNo");
	System.out.println(classApplyNo + "<-- deleteClassOpenApplyAction param classApplyNo");
	
	int row = ClassOpenApplyDAO.deleteClassOpenApplyAction(classApplyNo, professorNo);
	
	if(row == 1){
		System.out.println("삭제 성공");
	} else {
		System.out.println("삭제 실패");
	}
	
	response.sendRedirect("/lms/professor/class/classOpenApplyList.jsp");
%>

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
	String className = request.getParameter("className");
	String subjectName = request.getParameter("subjectName");
	String days = request.getParameter("days");
	int periodStart = Integer.parseInt(request.getParameter("periodStart"));
	int year = Integer.parseInt(request.getParameter("year"));
	int semester = Integer.parseInt(request.getParameter("semester"));
	
	//디버깅
	System.out.println(professorNo + "<-- addClassOpenApplyAction session professorNo");
	System.out.println(className + "<-- addClassOpenApplyAction param className");
	System.out.println(subjectName + "<-- addClassOpenApplyAction param subjectName");
	System.out.println(days + "<-- addClassOpenApplyAction param days");
	System.out.println(periodStart + "<-- addClassOpenApplyAction param periodStart");
	System.out.println(year + "<-- addClassOpenApplyAction param year");
	System.out.println(semester + "<-- addClassOpenApplyAction param semester");
	
	int row = ClassOpenApplyDAO.insertClassOpenApplyAction(professorNo, subjectName, className, days, periodStart, year, semester);
	
	if(row == 1){
		System.out.println("신청 성공");
		response.sendRedirect("/lms/professor/class/classOpenApplyList.jsp");
	} else {
		System.out.println("신청 실패");
		response.sendRedirect("/lms/professor/class/addClassOpenApplyForm.jsp");
	}
%>
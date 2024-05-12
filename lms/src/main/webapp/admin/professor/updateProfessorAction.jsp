<%@page import="lms.dao.ProfessorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int professorNo = Integer.parseInt(request.getParameter("professorNo"));
	String department = request.getParameter("department");
	String state = request.getParameter("state");
	String officeNo = request.getParameter("officeNo");
	
	//디버깅
	System.out.println(professorNo + "<-- updateProfessorAction param professorNo");
	System.out.println(department + "<-- updateProfessorAction param department");
	System.out.println(state + "<-- updateProfessorAction param state");
	System.out.println(officeNo + "<-- updateProfessorAction param officeNo");
	
	int row = ProfessorDAO.updateProfessor(professorNo, department, state, officeNo);
	
	
	if(row == 1){
		System.out.println("교수 정보 수정 성공");
		
	} else {
		System.out.println("교수 정보 수정 실패");
	}
	response.sendRedirect("/lms/admin/professor/professorOne.jsp?professorNo=" + professorNo);

%>
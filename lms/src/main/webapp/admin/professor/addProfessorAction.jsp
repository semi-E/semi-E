<%@page import="lms.dao.Professor_Pw_History"%>
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
	String name = request.getParameter("name");
	String department = request.getParameter("department");
	//디버깅
	System.out.println(professorNo + "<-- addProfessorAction param professor_no");
	System.out.println(name + "<-- addProfessorAction param name");
	System.out.println(department + "<-- addProfessorAction param department");
	
	
	
	int row = ProfessorDAO.insertProfessor(professorNo, name, department);
	
	if(row == 1){
		System.out.println("교수 등록 성공");
		row = Professor_Pw_History.insertProfessorPwHistory(professorNo);
		if(row == 1){
			System.out.println("교수 비밀번호 설정 성공");
			response.sendRedirect("/lms/admin/professor/professorList.jsp");
		} else {
			System.out.println("교수 비밀번호 설정 실패");
			response.sendRedirect("/lms/admin/professor/addProfessorForm.jsp");
		}
		
	} else {
		System.out.println("교수 등록 실패");
		response.sendRedirect("/lms/admin/professor/addProfessorForm.jsp");
	}
%>
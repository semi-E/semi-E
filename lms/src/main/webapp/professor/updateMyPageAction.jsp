<%@page import="lms.dao.ProfessorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int professorNo = 220241001;
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	System.out.println(gender + "<-- updateMyPageAction param gender");
	System.out.println(birthday + "<-- updateMyPageAction param birthday");
	System.out.println(phone + "<-- updateMyPageAction param phone");
	System.out.println(email + "<-- updateMyPageAction param email");
	System.out.println(professorNo + "<-- updateMyPageAction session professorNo");
	
	int row = ProfessorDAO.updateProfessor(professorNo, gender, birthday, phone, email);
	
	if(row == 1){
		System.out.println("교수 마이페이지 수정 성공");
		response.sendRedirect("/lms/professor/myPage.jsp");
	} else {
		System.out.println("교수 마이페이지 수정 실패");
		response.sendRedirect("/lms/professor/updateMyPageForm.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AssignmentDAO"%>    
 
    
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>


<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String endDate = request.getParameter("endDate");
	
	System.out.println(classApplyNo+"<----classApplyNo");
	System.out.println(title+"<----title");
	System.out.println(content+"<----content");
	System.out.println(endDate+"<----endDate");

	int row = AssignmentDAO.insertAssignment(classApplyNo, title, content, endDate);
	
	if(row == 1){
		System.out.println("과제 추가 성공");
		response.sendRedirect("/lms/professor/classBoard/assignmentOne.jsp");
	} else {
		System.out.println("과제 추가 실패");
		response.sendRedirect(" /lms/professor/classBoard/addAssignmentForm.jsp");
	}
%>
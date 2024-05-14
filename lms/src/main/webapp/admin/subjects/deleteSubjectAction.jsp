<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.SubjectDAO"%>

<%
	String subjectName = request.getParameter("subjectName");
	System.out.println(subjectName + "<-- deleteSubject subjectName");
	
	int deleteSubject =SubjectDAO.deleteSubject(subjectName);
	
	if(deleteSubject==1){
		System.out.println("삭제에 성공하였습니다");
		response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
	}else{
		System.out.println("삭제에 실패하였습니다");
		response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
	}
%>
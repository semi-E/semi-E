<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.StudentAssignmentDAO"%>

<%
	String subjectName = request.getParameter("subjectName");
	System.out.println(subjectName + "<-- deleteSubject subjectName");
	
	int selectClassOpenApply = ClassOpenApplyDAO.selectClassOpenApply(subjectName);
	
	if(selectClassOpenApply==0){
		int deleteSubject =ClassOpenApplyDAO.selectClassOpenApply(subjectName);
		
		if(deleteSubject==1){
			System.out.println("삭제에 성공하였습니다");
			response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
		}else{
			System.out.println("삭제에 실패하였습니다");
			response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
		}
	}else{
		System.out.println("과목이 존재합니다");
		response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
	}
%>
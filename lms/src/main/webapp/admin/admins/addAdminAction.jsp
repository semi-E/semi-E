<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

<%
	int adminNo = request.getParameter("adminNo");
	String grade = request.getParameter("grade");
	String name = request.getParameter("name");
	int insertAdmin = AdminDAO.insertAdmin(adminNo, grade, name);
	
	
	if(insertAdmin == 1){ // 성공 했을 때
		
		System.out.println("어드민 추가 성공");
		response.sendRedirect("/lms/admin/admins/adminList.jsp");
	
	} else { // 실패 했을 때
		
		System.out.println("어드민 추가 실패");
		response.sendRedirect("/lms/admin/admins/addAdminForm.jsp");
	}
	
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%
	int adminNo = request.getParameter("adminNo");
	int deleteAdmin = AdminDAO.deleteAdmin(adminNo);
	
	//디버깅
	System.out.println(adminNo + " <-- deleteAdminAction adminNo");
	System.out.println(deleteAdmin + " <-- deleteAdminAction deleteAdmin");
	
	
	
	if(deleteAdmin == 1){ // 성공 했을 때
		
		System.out.println("어드민 삭제 성공");
		response.sendRedirect("/lms/admin/admins/adminList.jsp");
	
	} else { // 실패 했을 때
		
		System.out.println("어드민 삭제 실패");
		response.sendRedirect("/lms/admin/admins/adminList.jsp");
	}
	
%>
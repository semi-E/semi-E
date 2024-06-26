<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	//현재 페이지 시스템 알림
	System.out.println("페이지: deleteAdminAction.jsp");

	int adminNo = Integer.valueOf(request.getParameter("adminNo"));   
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
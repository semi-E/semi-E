<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

<%

	int adminNo = Integer.valueOf(request.getParameter("adminNo"));
	String grade = request.getParameter("grade");
	String name = request.getParameter("name");
	
	// 디버깅
	System.out.println(adminNo + " <-- addAdminAction adminNo");
	System.out.println(grade + " <-- addAdminAction grade");
	System.out.println(name + " <-- addAdminAction name");
	
	//DAO 호출
	int insertAdmin = AdminDAO.insertAdmin(adminNo, grade, name);
	
	// 디버깅
	System.out.println(adminNo + " <-- addAdminAction adminNo");
	
	if(insertAdmin == 1){ // 성공 했을 때
		
		System.out.println("어드민 추가 성공");
		response.sendRedirect("/lms/admin/admins/adminList.jsp");
	
	} else { // 실패 했을 때
		
		System.out.println("어드민 추가 실패");
		response.sendRedirect("/lms/admin/admins/addAdminForm.jsp");
	}
	
%>



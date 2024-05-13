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

	// control param
	String email = request.getParameter("email");
	int phone = Integer.parseInt(request.getParameter("phone"));
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	
	//디버깅
	System.out.println(email + " <-- updateMyPageAction email");
	System.out.println(phone + " <-- updateMyPageAction phone");
	System.out.println(address + " <-- updateMyPageAction address");
	System.out.println(gender + " <-- updateMyPageAction gender");
	System.out.println(birthday + " <-- updateMyPageAction birthday");
	
	
	//update를 위한 DAO 호출
	int updateAdmin = AdminDAO.updateAdmin(email, phone, address, gender, birthday);
	
	if(updateAdmin == 1){ // 성공 했을 때
		
		System.out.println("어드민 수정 성공");
		response.sendRedirect("/lms/admin/myPage.jsp");
	
	} else { // 실패 했을 때
		
		System.out.println("어드민 수정 실패");
		response.sendRedirect("/lms/admin/updateMyPageForm.jsp");
	}


%>
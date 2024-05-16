<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	int adminNo = (Integer)(sessionInfo.get("adminNo"));
	
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	//디버깅
	System.out.println(gender + "<-- updateMyPageAction param gender");
	System.out.println(birthday + "<-- updateMyPageAction param birthday");
	System.out.println(phone + "<-- updateMyPageAction param phone");
	System.out.println(email + "<-- updateMyPageAction param email");
	System.out.println(adminNo + "<-- updateMyPageAction session adminNo");
	System.out.println(address + "<-- updateMyPageAction session address");
	
	
	//update를 위한 DAO 호출
	int updateAdmin = AdminDAO.updateAdmin(adminNo, email, phone, address, gender, birthday);
	
	if(updateAdmin == 1){ // 성공 했을 때
		
		System.out.println("어드민 수정 성공");
		response.sendRedirect("/lms/admin/myPage.jsp");
	
	} else { // 실패 했을 때
		
		System.out.println("어드민 수정 실패");
		response.sendRedirect("/lms/admin/updateMyPageForm.jsp");
	}


%>
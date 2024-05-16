<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*" %>

<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	//디버깅
	System.out.println(classApplyNo + " <-- addMyClassAction classApplyNo");
	System.out.println(studentNo + " <-- addMyClassAction StudentNo");
	
	int row = MyclassDAO.insertMyClass(studentNo, classApplyNo);
	
	
	if(row == 1){
		System.out.println("내 강의 추가 성공");
		response.sendRedirect("/lms/student/classApply/myClassList.jsp");
		
	}else {
		System.out.println("내 강의 추가 실패");	
		response.sendRedirect("/lms/student/classApply/classBasketList.jsp"); 
	
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	String state = request.getParameter("state");
	String classRoom = request.getParameter("classRoom");
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	//디버깅
	System.out.println(state + "<-- updateNoticeAction param state");
	System.out.println(classRoom + "<-- updateNoticeAction param classRoom");
	System.out.println(classApplyNo + "<-- updateNoticeAction classApplyNo");

	int row = ClassOpenApplyDAO.updateClassOpenApply(classRoom, state, classApplyNo);
	if(row == 1){
		System.out.println("수강신청상세보기 수정 성공");
		response.sendRedirect("/lms/admin/subjects/classOpenApplyList.jsp");
	} else {
		System.out.println("수강신청상세보기 수정 실패");
		response.sendRedirect("/lms/admin/subjects/classOpenApplyOne.jsp");
	}
 %>
<%@page import="lms.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + "<-- deleteNotice.jsp noticeNo");

	//DAO호출
	int deleteNotice = NoticeDAO.deleteNotice(noticeNo);
	
	if(deleteNotice==1){ //삭제 성공
		System.out.println("공지가 삭제되었습니다");
		response.sendRedirect("/lms/admin/notice/noticeList.jsp");
	}else{//삭제 실패
		System.out.println("공지가 삭제되지 않았습니다");
		response.sendRedirect("/lms/admin/notice/noticeList.jsp");
	}
%>	
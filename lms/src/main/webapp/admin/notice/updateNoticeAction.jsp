<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="lms.dao.NoticeDAO"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	//디버깅
	System.out.println(title + "<-- updateNoticeAction param title");
	System.out.println(content + "<-- updateNoticeAction param content");
	System.out.println(noticeNo + "<-- updateNoticeAction noticeNo");

	int row = NoticeDAO.updateNotice(title, content, noticeNo);
	if(row == 1){
		System.out.println(" 공지사항 수정 성공");
		response.sendRedirect("/lms/admin/notice/noticeList.jsp");
	} else {
		System.out.println("공지사항 수정 실패");
		response.sendRedirect("/lms/admin/notice/updateNoticeForm.jsp");
	}
	 %>
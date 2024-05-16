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
	//파라미터

	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	int adminNo = (Integer)(sessionInfo.get("adminNo"));	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//디버깅
	System.out.println(adminNo+"<-- addNoticeAction param adminNo");
	System.out.println(title+"<-- addNoticeAction param title");
	System.out.println(content+"<-- addNoticeAction param content");
%>

<%
	int addNotice = NoticeDAO.addNotice( adminNo,  title, content);
	
	if(addNotice == 1){
		System.out.println("공지사항 추가에 성공했습니다");
		response.sendRedirect("/lms/admin/notice/noticeList.jsp");
	}else{
		System.out.println("공지사항 추가에 실패했습니다");
		response.sendRedirect("/lms/admin/notice/addNoticeForm.jsp");
		
	}
%>

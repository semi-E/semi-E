<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*" %>

<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//디버깅
	System.out.println(classApplyNo + " <-- deleteClassBasketAction classApplyNo");
	System.out.println(studentNo + " <-- deleteClassBasketAction StudentNo");
	
	
	int row = ClassBasketDAO.deleteClassBasket(classApplyNo, studentNo);
	
	if(row == 1){
		System.out.println("삭제 성공");
	} else {
		System.out.println("삭제 실패");
	}
	
	response.sendRedirect("/lms/student/classApply/classBasketList.jsp");

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@page import="lms.dao.SubjectDAO"%>
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
	String subjectName = request.getParameter("subjectName");
	int credit = Integer.parseInt(request.getParameter("credit"));
	
	System.out.println(adminNo+"<--addSubjectAction adminNo");
	System.out.println(subjectName+"<--addSubjectAction subjectName");
	System.out.println(credit +"<--addSubjectAction credit");
	
	//DAO호출 
	int insertSubject = SubjectDAO.insertSubject(subjectName,adminNo,credit);
	
	if(insertSubject==1){
		System.out.println("과목추가 성공하였습니다");
		response.sendRedirect("/lms/admin/subjects/subjectList.jsp");
	}else{
		System.out.println("과목추가에 실패하였습니다");
		response.sendRedirect("/lms/admin/subjects/addSubjectForm.jsp");
	}
%>


<%@page import="lms.dao.StudentAssignmentDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//디버깅
	System.out.println(studentNo + "<-- submitMyClassAssignmentAction session studentNo");
	System.out.println(assignmentNo + "<-- submitMyClassAssignmentAction param assignmentNo");
	System.out.println(classApplyNo + "<-- submitMyClassAssignmentAction param classApplyNo");
	System.out.println(title + "<-- submitMyClassAssignmentAction param title");
	System.out.println(content + "<-- submitMyClassAssignmentAction param content");
	
	int row = StudentAssignmentDAO.insertStudentAssignment(assignmentNo, studentNo, classApplyNo, title, content);
	
	if(row == 1){
		System.out.println("제출 성공");
		response.sendRedirect("/lms/student/classBoard/myClassAssignmentOne.jsp?assignmentNo=" + assignmentNo);
	} else {
		System.out.println("제출 실패");
		response.sendRedirect("/lms/student/classBoard/submitMyClassAssignmentForm.jsp?assignmentNo=" + assignmentNo);
	}
%>
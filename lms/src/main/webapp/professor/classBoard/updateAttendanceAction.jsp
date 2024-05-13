<%@page import="lms.dao.AttendanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	String[] paramStudentNo = request.getParameterValues("studentNo");
	String[] state = request.getParameterValues("state");
	
	//디버깅
	System.out.println(classApplyNo + "<-- updateAttendanceAction param classApplyNo");
	System.out.println(paramStudentNo + "<-- updateAttendanceAction param paramStudentNo");
	System.out.println(state + "<-- updateAttendanceAction param state");
	
	int[] studentNo = new int[paramStudentNo.length];
	//String[] 을 int[]로 변환
	for(int i = 0; i < paramStudentNo.length; i++){
		studentNo[i] = Integer.parseInt(paramStudentNo[i]);
		//디버깅
		System.out.println(studentNo[i]);
	}

	int week = 0;
	int row = 0;
	
	for(int i = 0; i < studentNo.length; i++){
		for(int j = 0; j < 15; j++){
			week++;
			row += AttendanceDAO.updateAttendance(classApplyNo, studentNo[i], week, state[(i * 15) + j]);
		}
		week = 0;
	}
	
	System.out.println(row + "<-- row");
	
	if(row == state.length){
		System.out.println("수정 성공");
	} else {
		System.out.println("수정 실패");
	}
	
	response.sendRedirect("/lms/professor/classBoard/attendanceList.jsp?classApplyNo=" + classApplyNo);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.GradeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	System.out.println("updateGradeAction 진입");
	
	String paramStudentNo = request.getParameter("studentNo");
	String paramClassApplyNo = request.getParameter("classApplyNo");
	String  paramMidExam = request.getParameter("midExam");
	String paramFinalExam = request.getParameter("finalExam");
	
	//디버깅
	System.out.println(paramStudentNo + "<-- updateGadeAction  paramStudentNo");
	System.out.println(paramClassApplyNo + "<-- updateGadeAction  paramClassApplyNo");
	System.out.println(paramMidExam + "<-- updateGadeAction  paramMidExam");
	System.out.println(paramFinalExam + "<-- updateGadeAction  paramFinalExam");
	
	if(paramStudentNo == null || paramStudentNo.equals("")){
		paramStudentNo = "0";
	}
	int studentNo = Integer.parseInt(paramStudentNo);
	
	if(paramClassApplyNo == null || paramClassApplyNo.equals("")){
		paramClassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(paramClassApplyNo);
	
	if(paramMidExam == null || paramMidExam.equals("")){
		paramMidExam = "0";
	}
	int midExam = Integer.parseInt(paramMidExam);
	
	if(paramFinalExam == null || paramFinalExam.equals("")){
		paramFinalExam = "0";
	}
	int finalExam = Integer.parseInt(paramFinalExam);
	
	
	
	
	int row = GradeDAO.updateGrade(studentNo, classApplyNo, midExam, finalExam);
	
	if(row == 1){
		System.out.println("성적 수정 성공");
		response.sendRedirect("/lms/professor/classBoard/gradeList.jsp");
	} else {
		System.out.println("성적 수정 실패");
		response.sendRedirect("/lms/professor/classBoard/gradeList.jsp");
	}
	
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	String department = request.getParameter("department");
	System.out.println(department + "<--addDepartment department");
	
	int adminNo = Integer.parseInt(request.getParameter("adminNo"));
	System.out.println(adminNo + "<--addDepartment adminNo");
	
	//DAO호출 
	int insertDepartment = DepartmentDAO.insertDepartment(department,adminNo);
	
	if(insertDepartment==1){ // 학과추가성공
		System.out.println("학과 추가에 성공했습니다");
		response.sendRedirect("/lms/admin/department/departmentList.jsp");
		
	}else{
		System.out.println("학과 추가에 실패했습니다");
		response.sendRedirect("/lms/admin/department/departmentList.jsp");
	
	}
	
	
%>
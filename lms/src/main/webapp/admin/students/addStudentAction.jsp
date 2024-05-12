<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "lms.dao.*"%>   

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
    
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String name = request.getParameter("name");
	String department = request.getParameter("department");
	
%>

<%	
	System.out.println(studentNo+"<-----studentNo");
	System.out.println(name+"<-----name");
	System.out.println(department+"<-----deprartment");

	
	
	
	int row = 0; 
	
	row = StudentDAO.insertStudent(studentNo, name, department);
			
	if(row > 0){
		System.out.println("학생 추가 성공");
		response.sendRedirect("/lms/admin/students/studentList.jsp");
	} else {
		System.out.println("학생 추가 실패");
		response.sendRedirect("/lms/admin/students/addStudentForm.jsp");
	}

	
%>
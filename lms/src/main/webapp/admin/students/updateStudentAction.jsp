<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>    
       
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String department = request.getParameter("department");
	String state = request.getParameter("state"); 
	
	System.out.println(studentNo+"<----studentNo");
	System.out.println(department+"department");
	System.out.println(state+(state+"<----state"));
	
	int row = StudentDAO.updatestudent(studentNo, department, state);
	
	if(row == 1){
		System.out.println("학생정보수정 성공");
	}else 
		System.out.println("학생정보수정 실페");
	
		
%>    
      
    
    
    
    
    

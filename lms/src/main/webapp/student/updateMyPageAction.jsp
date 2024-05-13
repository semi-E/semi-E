<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>     
 <%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>   
    
       
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	
	System.out.println(studentNo+"<---studentNo");
	System.out.println(email+"<---email");
	System.out.println(phone+"<---phonew");
	System.out.println(address+"<---address");
	System.out.println(gender+"<---gender");
	System.out.println(birthday+"<--birthday");

	
	
	int row = StudentDAO.updatestudent(studentNo, email, phone, address, gender, birthday);

			
	if(row == 1){
		System.out.println("학생마이페지이 수정 성공");
		response.sendRedirect("/lms/student/myPage.jsp");
				
	}else 
		System.out.println("학생마이페이지 수정 실패");	
		response.sendRedirect("/lms/student/updateMyPageForm.jsp?studentNo="+studentNo);
	
	
	
	
%>


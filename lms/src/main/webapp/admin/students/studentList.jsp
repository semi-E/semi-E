<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>    
<%@ page import = "lms.dao.*"%>      
<%
	
	int studentNo = 0;
	//Integer.parseInt(request.getParameter("studentNo"));
	
	
	
	
	
	
	String name = request.getParameter("name");
	String department = request.getParameter("department");
	
	System.out.println(studentNo+"<-----studentNo");
	System.out.println(name+"<----name");
	System.out.println(department+"<----department");
	
	int currentPage = 1;
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	ArrayList<HashMap<String, Object>> studentList = StudentDAO.selectstudentList(studentNo, name, department, startRow, rowPerPage);
	
	
	
%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h1>학생 리스트</h1>
			
			<form method="get" action="/lms/admin/students/studentList.jsp">
				학생번호:<input type = "text" name="studentNo">
				이름:<input type = "text" name="name">
				학과:<input type = "text" name="department">
				
				<button type="submit">검색</button>
			</form>
			
			<a href="/lms/admin/students/addStudentForm.jsp">학생추가</a>
			
			
		<table border="1">
		    <tr>
		        <th>번호</th>
		        <th>이름</th>
		        <th>학과</th>
		    </tr>
		    
		    <% for(HashMap<String, Object> student	:studentList) { %>
		        <tr>
		            <td><a href = "/lms/admin/students/studentOne.jsp?studentNo=<%= student.get("studentNo") %>"><%= student.get("studentNo") %></a></td>
		            <td><%= student.get("name") %></td>
		            <td><%= student.get("department") %></td>
		        </tr>
		    <% 
		   		 } 
		    %>
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


</body>
</html>
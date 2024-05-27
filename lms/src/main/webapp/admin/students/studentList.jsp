<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>    
<%@ page import = "lms.dao.*"%>      

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	String paramstudentNo =request.getParameter("studentNo");	
	String name = request.getParameter("name");
	String department = request.getParameter("department");

	System.out.println(paramstudentNo+"<-----studentNo");
	System.out.println(name+"<----name");
	System.out.println(department+"<----department");
	
	if(paramstudentNo == null || paramstudentNo.equals("")){
		paramstudentNo = "0";
	}
	int studentNo = Integer.parseInt(paramstudentNo);
	
	if(department == null){
		department = "";
	}
	
	if(name == null){
		name = "";
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	int cnt = StudentDAO.selectstudentCount(studentNo, name, department);
	int lastPage = 0;
	

	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	int row = StudentDAO.selectstudentCount(studentNo, name, department);
	
	ArrayList<HashMap<String, Object>> studentList = StudentDAO.selectstudentList(studentNo, name, department, startRow, rowPerPage);
	
	
	
	
	
%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<jsp:include page="/admin/include/studentSidebar.jsp"></jsp:include>
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
		    
		    <% 
		    	for(HashMap<String, Object> student	:studentList)  {
		    %>
		        <tr>
		            <td><a href = "/lms/admin/students/studentOne.jsp?studentNo=<%= student.get("studentNo") %>"><%= student.get("studentNo") %></a></td>
		            <td><%= student.get("name") %></td>
		            <td><%= student.get("department") %></td>
		        </tr>
		    <% 
		   		 } 
		    %>
		</table>
		
		
		<!-- 페이징 -->
	<%
		if(currentPage > 1){
	%>
			<a href="/lms/admin/students/studentList.jsp?currentPage=1&studentNo=<%=studentNo%>&name=<%=name%>&department=<%=department%>">처음</a>
			<a href="/lms/admin/students/studentList.jsp?currentPage=<%=currentPage - 1 %>&studentNo=<%=studentNo%>&name=<%=name%>&department=<%=department%>">이전</a>
	<%
		}
	%>
	
	<%
		if(currentPage < lastPage){
	%>
			<a href="/lms/admin/students/studentList.jsp?currentPage=<%=currentPage + 1 %>&studentNo=<%=studentNo%>&name=<%=name%>&department=<%=department%>">다음</a>
			<a href="/lms/admin/students/studentList.jsp?currentPage=<%=lastPage%>&studentNo=<%=studentNo%>&name=<%=name%>&department=<%=department%>">마지막</a>
	<%
		}
	%>	

	</div>
</body>
</html>
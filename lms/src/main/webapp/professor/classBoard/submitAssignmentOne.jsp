<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.StudentAssignmentDAO"%>   
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>   

<%
  	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

 <%

 	int assignmentNo = Integer.parseInt((request.getParameter("assignmentNo")));
 	
 	int studentNo = Integer.parseInt((request.getParameter("studentNo")));
 	
 	System.out.println(assignmentNo+"<----assignmentNo");
 	System.out.println(studentNo+"<---studentNo");

	
 	HashMap<String, Object> m = StudentAssignmentDAO.selectStudentAssignment(assignmentNo, studentNo);
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>제출 과제 리스트 상세보기</h1>
	<table border ="1">
		<tr>
			<td>제목</td>
			<td><%=m.get("title") %></td>
		</tr>	
		
		<tr>
			<td>파일</td>
			<td><%=m.get("file") %></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td><%=m.get("content") %></td>
		</tr>	
		
		<tr>
			<td>수정날짜</td>
			<td><%=m.get("updateDate") %></td>
		</tr>	
		
		<tr>
			<td>생성날짜</td>
			<td><%=m.get("createDate") %></td>
		</tr>	

	</table>



</body>
</html>
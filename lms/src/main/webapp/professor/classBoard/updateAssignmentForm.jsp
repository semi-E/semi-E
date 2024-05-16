<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AssignmentDAO"%>
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
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	
	System.out. println(assignmentNo+"<--------------assignmentNo");
	
	HashMap<String, Object> m = AssignmentDAO.selectAssignment(assignmentNo);

%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>과제 상세보기</h1>

<form method ="get" action="/lms/professor/classBoard/updateAssignmentAction.jsp">

	<table border = "1">
		<tr>
			<td>과제번호</td>
			<td>
			<%=assignmentNo%>
			<input type = "hidden" name = "assignmentNo" value ="<%=assignmentNo%>">
			</td>
			<input type = "hidden" name = "classApplyNo" value ="<%=m.get("classApplyNo")%>">
		</tr>
			
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "title" value ="<%=m.get("title")%>"></td>
		</tr>	
		
		<tr>
			<td>내용</td>
			<td><input type = "text" name = "content" value ="<%=m.get("content")%>"></td>
		</tr>	
		
		<tr>
			<td>생성날짜</td>
			<td><%=m.get("createDate")%></td>
		</tr>	
		
		<tr>
			<td>종료날짜</td>
			<td><input type = "datetime" name = "endDate" value ="<%=m.get("endDate")%>"></td>
		</tr>		
			
					
	</table>
	
	<button type="submit">과제수정</button>	
	
</form>
	
	




</body>
</html>
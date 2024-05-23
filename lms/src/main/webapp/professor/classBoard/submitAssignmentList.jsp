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
	int classApplyNo = 3;//Integer.parseInt(request.getParameter("classApplyno")); 
 	int assignmentNo = 3; //Integer.parseInt(request.getParameter("assignmentNo")); 
 	
 	System.out. println(classApplyNo+"<----classApplyNo");
 	System.out. println(assignmentNo+"<---assignmentNo");
 
	ArrayList<HashMap<String, Object>> list = StudentAssignmentDAO.selectStudentAssignmentList(classApplyNo, assignmentNo);
 %>   
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container-scroller">
		<jsp:include page="/professor/include/header.jsp"></jsp:include>
		<h1>제출과제 리스트</h1>
		<table border="1">
			<tr>
				<td>제목</td>	
				<td>제출 날짜</td>
				<td>생성 날짜</td>
			</tr>
		
		
		
		<%
			for( HashMap<String, Object> m  : list) {
		%>
			<tr>
				<td><a href="/lms/professor/classBoard/submitAssignmentOne.jsp?assignmentNo=<%=assignmentNo%>&studentNo=<%=m.get("studentNo")%>"><%= m.get("title")%></a></td>
				<td><%=m.get("updateDate") %></td>
				<td><%=m.get("createDate") %></td>
			</tr>
		
		<% 
			}
		%>
		
		
		</table>
	</div>


</body>
</html>
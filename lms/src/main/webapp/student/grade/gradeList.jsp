<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>   

<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
	
<%
	int studentNo = 20240102; //Integer.parseInt(request.getParameter("studentNo"));
	int classApplyNo = 3; // Integer.parseInt(request.getParameter("classApplyNo"));
	
	System.out.println(studentNo+"<------studentNo");
	System.out.println(classApplyNo+"<------classApplyNo");
	
	//DAO
	 ArrayList<HashMap<String, Object>> list = GradeDAO.selectGradeList1(studentNo, classApplyNo);
	
	
%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gradeList</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/student/include/header.jsp"></jsp:include>
		<jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
	
		<h1>성적 리스트</h1>
		<table border = "1">
			<tr>
				<td>학생번호</td>
				<td>중간고사</td>
				<td>기말고사</td>
				<td>출석</td>
				<td>과제</td>
				<td>전체성적</td>
			</tr>
			
			<%
				for(HashMap m : list){
			%>
				<tr>
					<td><%=m.get("studentNo") %></td>
					<td><%=m.get("midexam") %></td>
					<td><%=m.get("finalexam") %></td>
					<td><%=m.get("attendanceScore") %></td>
					<td><%=m.get("assignmentScore") %></td>
					<td><%=m.get("totalScore") %></td>
				</tr>
			
			<%		
				}
			%>
			
			
			
		</table>
	

	</div>
</body>
</html>
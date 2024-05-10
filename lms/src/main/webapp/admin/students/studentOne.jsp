<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>    
    
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	
	HashMap<String, Object> m = StudentDAO.selectStudent(studentNo);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 정보 상세보기</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%= m.get("student_no")%></td>
		</tr>

		<tr>
			<th>이름</th>
			<td><%= m.get("name")%></td>
		</tr>

		<tr>
			<th>성별</th>
			<td><%= m.get("gender")%></td>
		</tr>

		<tr>
			<th>전화번호</th>
			<td><%= m.get("phone")%></td>
		</tr>

		<tr>
			<th>주소</th>
			<td><%= m.get("address")%></td>
		</tr>

		<tr>
			<th>재학상태</th>
			<td><%= m.get("state")%></td>
		</tr>

		<tr>
			<th>이메일</th>
			<td><%= m.get("email")%></td>
		</tr>

		<tr>
			<th>학과</th>
			<td><%= m.get("department")%></td>
		</tr>

	</table>
	
	<a href="/lms/admin/students/updateStudentAction.jsp">학생정보 수정</a>
	
	
	
</body>
</html>
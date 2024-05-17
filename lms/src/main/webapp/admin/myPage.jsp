<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>     

    
<%
	//세션인증분기 - loginAdmin 어드민 
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
    
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	int adminNo = (Integer)(sessionInfo.get("adminNo"));


	HashMap<String, Object> m = AdminDAO.selectAdmin(adminNo);
	
%>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>
	<h1>myPage</h1>

	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=m.get("adminNo") %></td>
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
			<th>생년월일</th>
			<td><%= m.get("birthday")%></td>
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
			<th>이메일</th>
			<td><%= m.get("email")%></td>
		</tr>

		<tr>
			<th>등급</th>
			<td><%=m.get("grade") %></td>
		</tr>

	</table>
	
	<a href = "/lms/admin/updateMyPageForm.jsp">수정</a>
	
</body>
</html>
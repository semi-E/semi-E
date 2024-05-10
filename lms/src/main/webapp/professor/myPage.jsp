<%@page import="lms.dao.ProfessorDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int professorNo = 220241001;//세션되면 나중에 세션으로 수정
	
	//디버깅
	System.out.println(professorNo + "<-- myPage session professorNo");
	
	HashMap<String, Object> m = ProfessorDAO.selectProfessor(professorNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>
				<%=m.get("professorNo") %>
			</td>
			
		</tr>
		<tr>
			<th>이름</th>
			<td><%=m.get("name") %></td>
		</tr>
		<tr>
			<th>학과</th>
			<td><%=m.get("department") %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=m.get("gender") %></td>
		</tr>
		<tr>
			<th>생년월일</th>	
			<td><%=m.get("birthday") %></td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td><%=m.get("phone") %></td>
		</tr>
		<tr>
			<th>상태</th>
			<td><%=m.get("state")%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=m.get("email") %></td>
		</tr>
		<tr>
			<th>연구실</th>
			<td><%=m.get("officeNo") %></td>
		</tr>
	</table>
</body>
</html>
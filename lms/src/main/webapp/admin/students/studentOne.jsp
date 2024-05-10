<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>    
    
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));

	System.out.println(studentNo+"<------studentNo");
	
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
	
	<form method="post" action="/lms/admin/students/updateStudentAction.jsp">
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%= m.get("studentNo")%></td>
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
			<td>
					<select  name="state">
						<%
							if(m.get("state").equals("재학")){
						%>
								<option value="재직" selected>재직</option>
							    <option value="휴직">휴학</option>
							    <option value="퇴직">퇴학</option>
					    <%
					    	} else if(m.get("state").equals("재학")){
					    %>
					    		<option value="재학">재학</option>
							    <option value="휴학" selected>휴학</option>
							    <option value="퇴학">퇴학</option>
					    <%
					    	} else {
					    %>
					    		<option value="재학">재학</option>
							    <option value="휴학">휴학</option>
							    <option value="퇴학" selected>퇴학</option>
					    <%
					    	}
					    %>
					</select>
				</td>			
		</tr>

		<tr>
			<th>이메일</th>
			<td><%= m.get("email")%></td>
		</tr>

		<tr>
			<th>학과</th>
			<td><input type="text" name="department" value="<%=m.get("department") %>"></td>
		</tr>

	</table>
	
	<button type="submit">수정</button>
	
	</form>
	
</body>
</html>
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
	<h1>마이페이지 수정</h1>
	<form method="post" action="/lms/admin/professor/updateProfessorAction.jsp">
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
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select  name="gender">
						<%
							if(m.get("gender").equals("남")){
						%>
								<option>선택</option>
								<option value="남" selected>남</option>
							    <option value="여">여</option>
							   
					    <%
					    	} else if(m.get("gender").equals("여")){
					    %>
					    		<option>선택</option>
								<option value="남">남</option>
							    <option value="여" selected>여</option>
					    <%
					    	} else {
					    %>
					    		<option selected>선택</option>
								<option value="남">남</option>
							    <option value="여">여</option>
					    <%
					    	}
					    %>
					</select>
				</td>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>	
				<td><input type="date" value="<%=m.get("birthday") %>"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" value="<%=m.get("phone") %>"></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><%=m.get("state") %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" value="<%=m.get("email") %>"></td>
			</tr>
			<tr>
				<th>연구실</th>
				<td><%=m.get("officeNo") %></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>
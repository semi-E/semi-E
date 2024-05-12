<%@page import="lms.dao.ProfessorDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	
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
	<a href="/lms/professor/updateMyPageForm.jsp">수정</a>
	<a href="/lms/professor/updatePwForm.jsp">비밀번호 변경</a>
</body>
</html>
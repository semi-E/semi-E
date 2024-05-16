<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%

	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	int adminNo = (Integer)(sessionInfo.get("adminNo"));
	
	//디버깅
	System.out.println(adminNo + "<-- myPage session adminNo");
	
	HashMap<String, Object> m = AdminDAO.selectAdmin(adminNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body>
	<h1>마이페이지 수정</h1>
	<form method="post" action="/lms/admin/updateMyPageAction.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>
					<%=m.get("adminNo") %>
				</td>
				
			</tr>
			<tr>
				<th>이름</th>
				<td><%=m.get("name") %></td>
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
					    	} else if(m.get("gender")==null) {
					    %>
					    		<option selected>선택</option>
								<option value="남">남</option>
							    <option value="여">여</option>
					    <%
					    	}
					    %>
					</select>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>	
				<td><input type="date" name="birthday" value="<%=m.get("birthday") %>" required></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" name="phone" value="<%=m.get("phone") %>"></td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=m.get("email") %>"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td><%=m.get("grade") %></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>
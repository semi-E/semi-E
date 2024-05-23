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
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));

	HashMap<String, Object> m = StudentDAO.selectStudent(studentNo);
	
%>  
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/student/include/header.jsp"></jsp:include>
	
		<h1>마이페이지 수정</h1>
		<form method="post" action="/lms/student/updateMyPageAction.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%=m.get("studentNo") %></td>
			</tr>
	
			<tr>
				<th>이름</th>
				<td><%= m.get("name")%></td>
			</tr>
	
			<tr>
				<th>성별</th>
				<td>
					<select  name="gender">
							<%
								if(m.get("gender") == null){
						    %>
						    		<option selected>선택</option>
									<option value="남">남</option>
								    <option value="여">여</option>
							<%
								}else if(m.get("gender").equals("남")){
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
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="birthday" value="<%=m.get("birthday") %>"></td>
			</tr>
			
			
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="<%=m.get("phone") %>"></td>
			</tr>
	
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" value="<%=m.get("address") %>"></td>
			</tr>
	
			<tr>
				<th>재학상태</th>
				<td><%=m.get("state") %></td>			
			</tr>
	
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=m.get("email") %>"></td>
			</tr>
	 
			<tr>
				<th>학과</th>
				<td><%=m.get("department") %></td>
			</tr>
	
		</table>
		
		<button type="submit">수정</button>
		
		</form>
	</div>
	

</body>
</html>
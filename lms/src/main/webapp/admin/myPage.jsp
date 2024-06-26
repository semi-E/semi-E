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
    <title></title>
</head>	
<body>
    <div class="container-scroller">
        <jsp:include page="/admin/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/admin/include/myPageSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">MyPage</h1>
			
				<table border="1"  class="table table-bordered">
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
		
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%@ page import="java.util.*" %>

<%
	ArrayList<HashMap<String, Object>> selectAdminList = AdminDAO.selectAdminList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 리스트</title>
</head>
<body>
	<h1>직원 목록</h1>
	<table border = 1>
		<%
			for(HashMap m : selectAdminList){
		
		%>
				<tr>
					<td><%=(String)(m.get("admin_no"))%></td>
					<td><%=(String)(m.get("name"))%></td>
					<td><%=(String)(m.get("gender"))%></td>
					<td><%=(String)(m.get("birthday"))%></td>
					<td><%=(String)(m.get("phone"))%></td>
					<td><%=(String)(m.get("address"))%></td>
					<td><%=(String)(m.get("email"))%></td>
					<td><%=(String)(m.get("grade"))%></td>
					<td>
						<a href="/lms/admin/admins/deleteAdminAction.jsp?adminNo=<%=(String)(m.get("admin_no"))%>">삭제</a>
					</td>
				<tr>
		<%
			}
		%>
	</table>
</body>
</html>
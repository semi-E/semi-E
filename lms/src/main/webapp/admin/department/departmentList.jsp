<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.DepartmentDAO"%>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	ArrayList<HashMap<String, Object>> selectDepartmentList = DepartmentDAO.selectDepartmentList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<h1>학과 리스트</h1>
		<table border="1">
			<%
				for(HashMap m : selectDepartmentList){
			%>
				<tr>
					<td><%=(String)(m.get("department"))%></td>
					<td><%=(Integer)(m.get("admin_no"))%></td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>
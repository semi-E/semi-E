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
					<td><%=(String)(m.get("department"))%></td> <!-- 학과 --> 
					<td><%=(Integer)(m.get("admin_no"))%></td> <!-- 관리자번호 --> 
					<td><a href="/lms/admin/department/deleteDepartment.jsp?department=<%=(String)(m.get("department"))%>">삭제</a></td>	
				</tr>
			<%
				}
			%>
		</table>
		<hr>
		<br>
		<h2>학과 추가</h2>
		<form action="/lms/admin/department/addDepartment.jsp" method="post">
			<div>
				<label for="department">학과</label>
				<input type="text" required id="department" name="department" maxlength="20"> 
			</div>
			<%
				HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));			
				int adminNo = (Integer)(sessionInfo.get("adminNo"));
			 %>				
			관리자번호<input type="text" value="<%=adminNo%>" readonly>
			<button type="submit">추가하기</button>
		</form>
	</body>
</html>
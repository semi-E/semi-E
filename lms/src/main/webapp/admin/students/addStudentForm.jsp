<%@page import="lms.dao.DepartmentDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>    
<%
	ArrayList<HashMap<String, Object>> departmentList = DepartmentDAO.selectDepartmentList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container-scroller">
		<jsp:include page="/admin/include/header.jsp"></jsp:include>

		<form method="post" action="/lms/admin/students/addStudentAction.jsp">
			<div>
				<label for="studentNo">studentNo</label>
				<input type="text"name="studentNo" id="studentNo">
			</div>
		
			<div>
				<label for="name">이름</label> 
				<input type="text" name="name" id="name">
			</div>
			
			<div>
				<label for="department">학과</label> 
				<select name="department">
				<%
					for(HashMap m : departmentList){
				%>
						<option value=<%=m.get("department") %>><%=m.get("department") %></option>
				<%
					}
				%>
			</select>
			</div>
			
			<div><button type="submit">학생추가</button></div>
		</form>


	</div>




</body>
</html>
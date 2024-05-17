<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.DepartmentDAO"%>
<%@page import="lms.dao.ProfessorDAO"%>
<%@page import="java.util.HashMap"%>
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
	int professorNo = Integer.parseInt(request.getParameter("professorNo"));
	
	//디버깅
	System.out.println(professorNo + "<-- professorOne param professorNo");
	
	HashMap<String, Object> m = ProfessorDAO.selectProfessor(professorNo);
	
	ArrayList<HashMap<String, Object>> departmentList = DepartmentDAO.selectDepartmentList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>professorOne</title>
</head>
<body>
	<h1>교수 상세보기</h1>
	<form method="post" action="/lms/admin/professor/updateProfessorAction.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>
					<%=m.get("professorNo") %>
					<input type="hidden" name="professorNo" value="<%=m.get("professorNo") %>">
				</td>
				
			</tr>
			<tr>
				<th>이름</th>
				<td><%=m.get("name") %></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<select name="department">
						<%
							for(HashMap map : departmentList){
								if((map.get("department")).equals(m.get("department"))){
						%>
									<option value=<%=map.get("department") %> selected><%=map.get("department") %></option>
						<%
								} else {
						%>
									<option value=<%=map.get("department") %>><%=map.get("department") %></option>
						<%			
								}
							}
						%>
					</select>
				</td>
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
				<td>
					<select  name="state">
						<%
							if(m.get("state").equals("재직")){
						%>
								<option value="재직" selected>재직</option>
							    <option value="휴직">휴직</option>
							    <option value="퇴직">퇴직</option>
					    <%
					    	} else if(m.get("state").equals("휴직")){
					    %>
					    		<option value="재직">재직</option>
							    <option value="휴직" selected>휴직</option>
							    <option value="퇴직">퇴직</option>
					    <%
					    	} else {
					    %>
					    		<option value="재직">재직</option>
							    <option value="휴직">휴직</option>
							    <option value="퇴직" selected>퇴직</option>
					    <%
					    	}
					    %>
					</select>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=m.get("email") %></td>
			</tr>
			<tr>
				<th>연구실</th>
				<td><input type="text" name="officeNo" value="<%=m.get("officeNo") %>"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>
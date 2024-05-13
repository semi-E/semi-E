<%@page import="lms.dao.AttendanceDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
	int classApplyNo = 2;//Integer.parseInt(request.getParameter("classApplyNo")); classBoardOne.jsp생기면 사용
	
	//디버깅
	System.out.println(classApplyNo + "<-- attendanceList param classApplyNo");
	
	ArrayList<HashMap<String, Object>> attendanceList = AttendanceDAO.selectAttendanceList(classApplyNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>출결 관리</h1>
	<form method="post" action="/lms/professor/classBoard/updateAttendanceAction.jsp">
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<%
					for(int i = 1; i < 16; i++){
				%>
					<th><%=i %>주차</th>
				<%
					}
				%>
			</tr>
			<tr>
				<%
					int index = 1;
					for(HashMap m : attendanceList){
						if(index % 15 == 1){
				%>
							<td>
								<%=m.get("studentNo") %>
								<input type="hidden" name="studentNo" value="<%=m.get("studentNo")%>">
							</td>
							<td><%=m.get("name") %>
				<%				
						}
				%>
						<td>
							<select name="state">
				<%
								if(m.get("state").equals("O")){
				%>
									<option value="O" selected>O</option>
									<option value="/">/</option>
									<option value="X">X</option>
							
				<%
								} else if(m.get("state").equals("X")){
				%>
									<option value="O">O</option>
									<option value="/">/</option>
									<option value="X" selected>X</option>
				<%
								} else {
				%>
									<option value="O">O</option>
									<option value="/"  selected>/</option>
									<option value="X">X</option>
				<%
								}
				%>
							</select>
						</td>
				<%
						if(index % 15 == 0){
				%>
							</tr>
							<tr>
				<%
						}
						index++;
					}
				%>
			</tr>
		</table>
		<input type="hidden" name="classApplyNo" value="<%=classApplyNo%>">
		<button type="submit">수정</button>
	</form>
</body>
</html>
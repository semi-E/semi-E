<%@page import="lms.dao.AttendanceDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	//student/classBoard/myClassBoardOne.jsp ->강의번호별 출석을 볼수있음
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo")); // 수강하고있는 강의의 번호 - 강의에 따라서 출석이 다름
	
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
							</td>
							<td><%=m.get("name") %>
				<%				
						}
				%>
						<td><%=m.get("state") %></td>
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
</body>
</html>
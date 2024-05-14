<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*"%>

<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	
	ArrayList<HashMap<String, Object>> list = ClassOpenApplyDAO.selectMyClassOpenApplyList(professorNo, "승인");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
</head>
<body>
	<h1>강의 목록</h1>
	<table border="1">
		<tr>
			<th>강의 번호</th>
			<th>강의명</th>
			<th>강의실</th>
			<th>과목 명</th>
			<th>요일</th>
			<th>시작 교시</th>
			<th>년도</th>
			<th>학기</th>
			<th>학점</th>
		</tr>
		<%
			for(HashMap m : list){
		%>
				<tr>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("className") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classroom") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("subjectName") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("days") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("periodStart") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("year") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("semester") %></a></td>
					<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("credit") %></a></td>
				</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>
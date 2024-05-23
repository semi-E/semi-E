<%@page import="lms.dao.MyclassDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginStudent 학생 
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//디버깅
	System.out.println(studentNo+"<-- studentNo");
	
	ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo);
	
	
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
		<table border="1">
			<tr>
				<th>강의 번호</th>
				<th>학과 이름</th>
				<th>교수 번호</th>
				<th>강의명</th>
				<th>시작교시</th>
				<th>요일</th>
				<th>강의실</th>
				<th>년도</th>
				<th>학기</th>
				<th>학점</th>
			</tr>
			<%
				for(HashMap m : list){
			%>
					<tr>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("subjectName") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("professorNo") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("className") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("periodStart") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("days") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classroom") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("year") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("semester") %></a></td>
						<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("credit") %></a></td>
					</tr>
			<%
				}
			%>
			
		</table>
	</div>
</body>
</html>
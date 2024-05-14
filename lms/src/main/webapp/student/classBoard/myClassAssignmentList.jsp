<%@page import="lms.dao.AssignmentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
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

	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int classApplyNo = 2;//Integer.parseInt(request.getParameter("classApplyNo")); classBoardOne.jsp생기면 사용
	
	//디버깅
	System.out.println(studentNo + "<-- myClassAssignmentList session studentNo");
	System.out.println(currentPage + "<-- myClassAssignmentList param currentPage");
	System.out.println(classApplyNo + "<-- myClassAssignmentList param classApplyNo");
	
	// 검색된 assignment의 개수
	int cnt = AssignmentDAO.selectAssignmentCount(classApplyNo);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> assignmentList = AssignmentDAO.selectAssignmentList(classApplyNo, studentNo,startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과제 목록</h1>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>생성날짜</th>
			<th>제출기한</th>
		</tr>
		<%
			for(HashMap m : assignmentList){
		%>
				<tr>
					<td><a href="/lms/student/classBoard/myClassAssignmentOne.jsp?assignmentNo=<%=m.get("assignmentNo")%>"><%=m.get("title") %></a></td>
					<td><%=m.get("createDate") %></td>
					<td><%=m.get("endDate") %></td>
				</tr>
		<%
			}
		%>
	</table>
	
	<%
		if(currentPage > 1){
	%>
			<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=1&classApplyNo=<%=classApplyNo%>">처음</a>
			<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=currentPage - 1 %>&classApplyNo=<%=classApplyNo%>">이전</a>
	<%
		}
	%>
	
	<%
		if(currentPage < lastPage){
	%>
			<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=currentPage + 1 %>&classApplyNo=<%=classApplyNo%>">다음</a>
			<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=lastPage %>&classApplyNo=<%=classApplyNo%>">마지막</a>
	<%
		}
	%>
</body>
</html>
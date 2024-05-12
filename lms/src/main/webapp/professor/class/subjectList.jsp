<%@page import="lms.dao.SubjectDAO"%>
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
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	String subjectName = request.getParameter("subjectName");
	
	//디버깅
	System.out.println(currentPage + "<-- subjcetList param currentPage");
	System.out.println(subjectName + "<-- subjcetList param subjectName");
	
	
	if(subjectName == null){
		subjectName = "";
	}
	
	// 검색된 subject의 개수
	int cnt = SubjectDAO.selectSubjectCount(subjectName);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> subjectList = SubjectDAO.selectSubjectList(subjectName, startRow, rowPerPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 과목 목록</h1>
	<a href="/lms/professor/class/classList.jsp">강의 목록</a>
	<form method="get" action="/lms/professor/class/subjectList.jsp">
		과목 명 <input type="text" name="subjectName">
		<button type="submit">검색</button>
	</form>
	<table border="1">
		<tr>
			<th>과목 명</th>
			<th>학점</th>
		</tr>
		<%
			for(HashMap m : subjectList){
		%>
				<tr>
					<td><%=m.get("subjectName") %></td>
					<td><%=m.get("credit") %></td>
				</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>
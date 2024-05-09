<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.ProfessorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 검증
%>
<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	String paramProfessorNo = request.getParameter("professorNo");
	String department = request.getParameter("department");
	String name = request.getParameter("name");
	
	//디버깅
	System.out.println(currentPage + "<-- professorList param currentPage");
	System.out.println(paramProfessorNo + "<-- professorList param paramProfessorNo");
	System.out.println(department + "<-- professorList param department");
	System.out.println(name + "<-- professorList param name");
	
	if(paramProfessorNo == null){
		paramProfessorNo = "" + 0;
	}
	int professorNo = Integer.parseInt(paramProfessorNo);
	
	if(department == null){
		department = "";
	}
	
	if(name == null){
		name = "";
	}
	
	int startRow = 0;
	int rowPerPage = 10;
	
	ArrayList<HashMap<String, Object>> professorList = ProfessorDAO.selectProfessorList(professorNo, department, name, startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProfessorList</title>
</head>
<body>
	<h1>교수 목록</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>학과</th>
			<th>상태</th>
		</tr>
		<%
			for(HashMap<String, Object> m : professorList){
		%>
				<tr>
					<td><%=m.get("professorNo") %></td>
					<td><%=m.get("name") %></td>
					<td><%=m.get("department") %></td>
					<td><%=m.get("state") %></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>
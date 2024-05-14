<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="lms.dao.MyclassDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>    


 <%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>   


<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	System.out.println(studentNo+"<-----studentNo");
%>

<%
	String paramclassApplyNo = request.getParameter("classApplyNo");
	String paramprofessorNo = request.getParameter("professorNo");
	String paramperiodStart = request.getParameter("periodStart");
	String className = request.getParameter("className");
	String department = request.getParameter("department");
	String subjectName  = request.getParameter("subjectName");
	String days = request.getParameter("days");
	
	if(paramclassApplyNo == null || paramclassApplyNo.equals("")){
		paramclassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(paramclassApplyNo);
	
	if(paramprofessorNo == null || paramprofessorNo.equals("")){
		paramprofessorNo = "0";
	}
	int professorNo = Integer.parseInt(paramprofessorNo);
	
	if(paramperiodStart == null || paramperiodStart.equals("")){
		paramperiodStart = "0";
	}
	int periodStart = Integer.parseInt(paramperiodStart);
	
	
	
	
	if(className == null){
		className = "";
	}
	
	if(department == null){
		department = "";
	}
	if(subjectName == null){
		subjectName = "";
	}
	if(days == null){
		days = "";
	}
	

	
	
	



	ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo, classApplyNo, professorNo, className, department, subjectName, days, periodStart);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내 강의 목록</h1>
	<table border ="1">
		<tr>
			<td>강의 번호</td>
			<td>강의 이름</td>
			<td>교수 번호</td>
			<td>과목 이름</td>
			<td>요일</td>
			<td>시작 교시</td>
		</tr>
		<%
			for(HashMap<String,Object> m : list) {
		%>
			<tr>
				<td><a href="/lms/student/class/myClassOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
				<td><%=m.get("className") %></td>
				<td><%=m.get("professorNo") %></td>
				<td><%=m.get("subjectName") %></td>
				<td><%=m.get("days") %></td>
				<td><%=m.get("periodStart") %></td>
			</tr>
		<%
			}
		%>
	
		
	</table>
	
	
	
</body>
</html>
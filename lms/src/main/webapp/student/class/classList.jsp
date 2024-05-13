<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>     
<%
	
%>
 
<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String studentName = request.getParameter("studentName");
	String className = request.getParameter("className");
	String subjectName = request.getParameter("subjectName");
	String days = request.getParameter("days");
	int periodStart = Integer.parseInt(request.getParameter("periodStart"));
	int year = Integer.parseInt(request.getParameter("year"));
 	int semester = Integer.parseInt(request.getParameter("semester"));
	String state = request.getParameter("state");
	
	
	
	
	
	ArrayList<HashMap<String, Object>> list = ClassOpenApplyDAO.selectClassOpenApplyList1(classApplyNo, studentNo, studentName, className, subjectName, days, periodStart, year, semester, state, startRow, rowPerPage);
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의 리스트</h1>
	
	<table>
		<tr>
			<td>강의</td>
			<td>과목이름</td>
			<td>교수번호</td>
			<td>강의이름</td>
			<td>시간</td>
			<td>요일</td>
			<td>생성날짜</td>
			<td>업데이트 날짜</td>
			<td>상태</td>
			<td>관리자 번호</td>
			<td>강의실</td>
		</tr>
		
		<%
			for(HashMap<String,Object> m : list){
		%>
		<tr>
			<td><%=m.get("classApplyNo")%></td>
			<td><%=m.get("studentNo")%></td>
			<td><%=m.get("studentName")%></td>
			<td><%=m.get("className")%></td>
			<td><%=m.get("classroom")%></td>
			<td><%=m.get("subjectName")%></td>
			<td><%=m.get("days")%></td>
			<td><%=m.get("periodStart")%></td>
			<td><%=m.get("year")%></td>
			<td><%=m.get("semester")%></td>
			<td><%=m.get("credit")%></td>
		</tr>
		
		
		<% 	
			}
		
		%>
	
	
	</table>
	
	
</body>
</html>
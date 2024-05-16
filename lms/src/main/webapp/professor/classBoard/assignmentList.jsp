<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AssignmentDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

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
	int classApplyNo = 4;//Integer.parseInt(request.getParameter("classApplyNo")); classBoardOne.jsp생기면 사용
	
	//디버깅
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
		

	ArrayList<HashMap<String, Object>> list = AssignmentDAO.selectAssignmentList(classApplyNo, startRow, rowPerPage);
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>과제 리스트</h1>
	
	<table border = "1">
		<tr>
			<td>과제번호</td>
			<td>제목</td>
			<td>생성날짜</td>
			<td>종료날짜</td>
		</tr>

	
	<%
		for(HashMap m : list ){
	%>		
		<tr>
			<td><%=m.get("assignmentNo") %></td>
			<td><a href ="/lms/professor/classBoard/assignmentOne.jsp?assignmentNo=<%=m.get("assignmentNo") %>"><%=m.get("title") %></a></td>
			<td><%=m.get("createDate") %></td>
			<td><%=m.get("endDate") %></td>
		</tr>
			
	<%
		}
	%>
	
	</table>
	
	<a href ="/lms/professor/classBoard/addAssignmentForm.jsp?classApplyNo=<%=classApplyNo%>"><button>과제추가</button></a>
	
	
	
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
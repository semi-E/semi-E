<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.NoticeDAO"%>    
<%@page import="java.util.HashMap"%>   


<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	System.out.println(noticeNo+"<-----noticeNo");


	HashMap<String, Object> m = NoticeDAO.selectNotice(noticeNo);
%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내 강의 상세보기</h1>
	<table border ="1">
		<tr>
			<td>공지번호</td>
			<td><%=m.get("noticeNo") %></td>
		</tr>	
		
		<tr>
			<td>관리자번호</td>
			<td><%=m.get("adminNo") %></td>
		</tr>	
		<tr>
			<td>업로드날짜</td>
			<td><%=m.get("createDate") %></td>
		</tr>	
		
		<tr>
			<td>수정날짜</td>
			<td><%=m.get("updateDate") %></td>
		</tr>	
		<tr>	
			<td>제목</td>
			<td><%=m.get("title") %></td>		
		</tr>	
		
		<tr>	
			<td>내용</td>
			<td><%=m.get("content") %></td>		
		</tr>	
	</table>


</body>
</html>
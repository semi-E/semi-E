<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.NoticeDAO"%>  
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>       

<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
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
		
		String title = request.getParameter("title");
		//디버깅
		System.out.println(title + "<-- noticeList title");
	
		// title을 검색하지 않았을 경우
		if(title == null){
			title = "";
		}
		
		// 검색된 notice의 개수
		int cnt = NoticeDAO.selectNoticeCount(title);
		int lastPage = 0;
		
		int rowperPage = 10;
		int startRow = (currentPage - 1) * rowperPage;
		
		
		if(cnt % rowperPage == 0){
			lastPage = cnt / rowperPage;
		} else {
			lastPage = cnt / rowperPage + 1;
		}
		
 

 	ArrayList<HashMap<String, Object>> list = NoticeDAO.selectNoticeList(title, startRow, rowperPage);
 %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>공지 리스트</h1>
	
	<form method="get" action="/lms/professor/notice/noticeList.jsp">
		제목 : <input type="text" name="title">
		
		<button type="submit">검색</button>
	</form>
	
	<table border="1">
		<tr>
			<td>공지번호</td>
			<td>제목</td>
		</tr>

	
	<%
		for(HashMap<String, Object> m : list){
	%>
		<tr>
			<td><%=m.get("noticeNo") %></td>
			<td><a href="/lms/student/notice/noticeOne.jsp?noticeNo=<%=m.get("noticeNo") %>"><%=m.get("title") %></a></td>
		</tr>
	
	<%		
		}
	%>

	</table>
	
	
	<!-- 페이징 -->
	<%
		if(currentPage > 1){
	%>
			<a href="/lms/professor/notice/noticeList.jsp?currentPage=1&title=<%=title%>">처음</a>
			<a href="/lms/professor/notice/noticeList.jsp?currentPage=<%=currentPage - 1 %>&title=<%=title%>">이전</a>
	<%
		}
	%>
	
	<%
		if(currentPage < lastPage){
	%>
			<a href="/lms/professor/notice/noticeList.jsp?currentPage=<%=currentPage %>&title=<%=title%>">다음</a>
			<a href="/lms/professor/notice/noticeList.jsp?currentPage=<%=lastPage%>&title=<%=title%>">마지막</a>
	<%
		}
	%>
	

</body>
</html>
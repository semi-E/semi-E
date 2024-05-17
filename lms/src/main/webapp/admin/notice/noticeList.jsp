<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
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
	//파라미터
	String title = request.getParameter("title");	
	//디버깅
	System.out.println(currentPage + "<-- noticeList currentPage");
	System.out.println(title + "<-- noticeList title");
	//검색에 의해서 null값이 넘어오기때문에 예외처리를 해줘야함 
	if(title == null){
		title = "";
	}
	
	
	int cnt = NoticeDAO.selectNoticeCount(title);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	System.out.println(cnt +"<--cnt");
	
	//DAO 호출
	ArrayList<HashMap<String, Object>> selectNoticeList= NoticeDAO.selectNoticeList( title, startRow, rowPerPage);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 리스트</title>
</head>
	<body>
		<h1>공지 리스트</h1>
		<form action="/lms/admin/notice/noticeList.jsp" method="get">
			<input  type="text" name="title">
			<button type="submit">검색</button>
		</form>
		
		
		
		<table border="1">
				<tr>
					<th>게시물 이름</th>
					<th></th>
				</tr>
			<%
				for(HashMap m : selectNoticeList){
			%> 
				<tr>
					<td><a href="/lms/admin/notice/noticeOne.jsp?noticeNo=<%=m.get("noticeNo")%>"><%=m.get("title") %></a></td><!-- 공지  -->
					<td><a href="/lms/admin/notice/deleteNoticeAction.jsp?noticeNo=<%=(Integer)(m.get("noticeNo"))%>">삭제</a></td>	
				</tr>
			<%
				}
			%>
		</table>

	<%
		if(currentPage > 1){
	%>
			<a href="/lms/admin/notice/noticeList.jsp?currentPage=1&title=<%=title%>">처음</a>
			<a href="/lms/admin/notice/noticeList.jsp?currentPage=<%=currentPage - 1 %>&title=<%=title%>">이전</a>
	<%
		}
	%>
	
	<%
		if(currentPage < lastPage){
	%>
			<a href="/lms/admin/notice/noticeList.jsp?currentPage=<%=currentPage + 1 %>&title=<%=title%>">다음</a>
			<a href="/lms/admin/notice/noticeList.jsp?currentPage=<%=lastPage%>&title=<%=title%>">마지막</a>
	<%
		}
	%>
	</body>
</html>
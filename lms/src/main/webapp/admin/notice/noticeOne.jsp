<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + "<--noticeNo");
	
	HashMap<String, Object> m = NoticeDAO.selectNotice(noticeNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeOne</title>
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/admin/include/noticeSidebar.jsp"></jsp:include>
				<div class="main-panel">
					<div class="content-wrapper">		
					<table border="1">
					<tr>
						<th>공지번호</th>
						<td>
							<%=m.get("noticeNo") %>
						</td>
					</tr>
					<tr>
						<th>관리자번호</th>
						<td>
							<%=m.get("adminNo") %>
						</td>
					</tr>
					<tr>
						<th>작성 시간</th>
						<td>
							<%=m.get("createDate") %>
						</td>
					</tr>
					<tr>
						<th>수정 시간</th>
						<td>
							<%=m.get("updateDate") %>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<%=m.get("title") %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<%=m.get("content") %>
						</td>
					</tr>
				</table>
				<a href="/lms/admin/notice/noticeList.jsp">리스트</a>
				<a href="/lms/admin/notice/updateNoticeForm.jsp?noticeNo=<%= noticeNo %>">수정하기</a>
			</div>
		</div>
	</div>
</body>
</html>
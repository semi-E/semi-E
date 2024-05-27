<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNoticeForm</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<jsp:include page="/admin/include/noticeSidebar.jsp"></jsp:include>
		<h1>공지추가하기</h1>
		<form action="/lms/admin/notice/addNoticeAction.jsp" method="post">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title">
			</div>
			<div>
				<label for="content">내용</label>
				<textarea  name="content" id="content"></textarea>
			</div>
			<button type="submit">공지 추가하기</button>
		</form>
	</div>
</body>
</html>
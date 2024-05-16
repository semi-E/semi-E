<%@page import="lms.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + "<-- updateForm noticeNo");
	HashMap<String, Object> m = NoticeDAO.selectNotice(noticeNo);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<h1>공지수정하기</h1>
		<form method="post" action="/lms/admin/notice/updateNoticeAction.jsp">
			<div>
				<label>공지번호</label>
				<%=m.get("noticeNo") %>
				 <input type="hidden" name="noticeNo" value="<%=m.get("noticeNo") %>">
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title">
			</div>
			<div>
				<label for="content">내용</label>
				<textarea  name="content" id="content"></textarea>
			</div>
			<button type= "submit">수정하기</button>
		</form>
	</body>
</html>
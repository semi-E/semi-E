<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
    
<%
	//세션인증분기 - loginAdmin 어드민 
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	String grade = (String)(sessionInfo.get("grade"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<h1>Main</h1>
		
		<a href="/lms/admin/myPage.jsp">마이 페이지</a>
		<a href="/lms/admin/updateMyPageForm.jsp">내 정보 수정</a>
		<a href="/lms/admin/department/departmentList.jsp">학과리스트</a>
		<a href="/lms/admin/subjects/subjectList.jsp">과목리스트</a>
		<a href="/lms/admin/notice/noticeList.jsp">공지리스트</a>
		<%
		
			if(grade.equals("마스터")){
		%>
				<a href="/lms/admin/admins/adminList.jsp">관리자 목록</a>
		<%
			}
		%>
		
		
		<a href="/lms/logout.jsp">로그아웃</a>
	</div>
</body>
</html>
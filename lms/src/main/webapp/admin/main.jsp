<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//세션인증분기 - loginAdmin 어드민 
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

	<h1>Main</h1>
	
	<a href="/lms/admin/myPage.jsp">마이 페이지</a>
	<a href="/lms/admin/updateMyPageForm.jsp">내 정보 수정</a>
	<a href="/lms/admin/updatePwForm.jsp">비밀번호 변경</a>
	<a href="/lms/admin/admins/adminList.jsp">관리자 목록</a>
	<a href="/lms/admin/admins/addAdminForm.jsp">관리자 추가</a>
	<a href="/lms/admin/department/departmentList.jsp">학과리스트</a>
	<a href="/lms/admin/subjects/subjectList.jsp">과목리스트</a>
	<a href="/lms/admin/notice/noticeList.jsp">공지리스트</a>
	
	<a href="/lms/logout.jsp">로그아웃</a>

</body>
</html>
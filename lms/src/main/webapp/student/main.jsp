<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
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
	<div class="container-scroller">
		<jsp:include page="/student/include/header.jsp"></jsp:include>
		<h1>Main</h1>
		
		<a href ="/lms/student/class/subjectList.jsp">과목리스트</a>
		<a href ="/lms/student/class/classList.jsp">강의리스트</a>
		<a href ="/lms/student/myPage.jsp">마이페이지</a>
		<a href ="/lms/student/updateMyPageForm.jsp">내정보수정</a>
		<a href="/lms/student/updatePwForm.jsp">비밀번호 변경</a>
		<a href="/lms/student/classApply/classApplyList.jsp ">수강신청</a>
		<a href="/lms/student/class/myClassList.jsp">내 강의리스트</a>
		<a href="/lms/student/class/schedule.jsp">학생시간표</a>
		<a href="/lms/student/classBoard/myClassBoardList.jsp">나의 강의 게시판</a>
		<a href="/lms/student/classBoard/attendanceList.jsp">나의 출석</a>
		<a href="/lms/logout.jsp">로그아웃</a>
	</div>

</body>
</html>
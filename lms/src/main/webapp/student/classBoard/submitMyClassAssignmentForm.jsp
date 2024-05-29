<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) { 
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	//디버깅
	System.out.println(assignmentNo + "<-- submitMyClassAssignmentForm param assignmentNo");
	System.out.println(classApplyNo + "<-- submitMyClassAssignmentForm param classApplyNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/student/include/header.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/classBoardSidebar.jsp"></jsp:include>
			<h1>과제 제출</h1>
			<form method="post" action="/lms/student/classBoard/submitMyClassAssignmentAction.jsp" enctype="multipart/form-data">
				<input type="hidden" name="assignmentNo" value="<%=assignmentNo%>">
				<input type="hidden" name="classApplyNo" value="<%=classApplyNo%>">
				제목 : <input type="text" name="title"><br>
				파일 : <input type="file" name="file"><br>
				내용 : <textarea rows="5" cols="50" name="content"></textarea><br>
				<button type="submit">제출</button>
			</form>
		</div>
	</div>
</body>
</html>
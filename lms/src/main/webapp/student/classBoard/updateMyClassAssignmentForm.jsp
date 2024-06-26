<%@page import="lms.dao.StudentAssignmentDAO"%>
<%@page import="java.util.HashMap"%>
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
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	
	//디버깅
	System.out.println(studentNo + "<-- myClassAssignmentOne session studentNo");
	System.out.println(assignmentNo + "<-- myClassAssignmentOne param assignmentNo");
	
	HashMap<String ,Object> studentAssignment = StudentAssignmentDAO.selectStudentAssignment(assignmentNo, studentNo);
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
			<h1>과제 수정</h1>
			<form method="post" action="/lms/student/classBoard/updateMyClassAssignmentAction.jsp" enctype="multipart/form-data">
				<input type="hidden" name="assignmentNo" value="<%=assignmentNo%>">
				제목 : <input type="text" name="title" value="<%=studentAssignment.get("title") %>"><br>
				파일 : <input type="file" name="file"><br>
				내용 : <textarea rows="5" cols="50" name="content"><%=studentAssignment.get("content") %></textarea><br>
				<button type="submit">수정</button>
			</form>
		</div>
	</div>
</body>
</html>
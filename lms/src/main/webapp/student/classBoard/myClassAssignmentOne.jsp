<%@page import="lms.dao.StudentAssignmentDAO"%>
<%@page import="lms.dao.StudentDAO"%>
<%@page import="lms.dao.AssignmentDAO"%>
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
	
	HashMap<String ,Object> assignment = AssignmentDAO.selectAssignment(assignmentNo);
	
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
		<h1>과제 상세보기</h1>
		<table border="1">
			<tr>
				<th>제목</th>
				<td><%=assignment.get("title") %></td>
			</tr>
			<tr>
				<th>생성날짜</th>
				<td><%=assignment.get("createDate") %></td>
			</tr>
			<tr>
				<th>제출기한</th>
				<td><%=assignment.get("endDate") %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=assignment.get("content") %></td>
			</tr>
		</table>
		
		<%
			if(studentAssignment != null){
		%>
				<h2>제출 과제</h2>
				<table border="1">
					<tr>
						<th>제목</th>
						<td><%=studentAssignment.get("title") %></td>
					</tr>
					<tr>
						<th>제출날짜</th>
						<td><%=studentAssignment.get("createDate") %></td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td><%=studentAssignment.get("updateDate") %></td>
					</tr>
					<tr>
						<th>파일</th>
						<td><a href="/lms/upload/<%=studentAssignment.get("file") %>"><%=studentAssignment.get("file") %></a></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=studentAssignment.get("content") %></td>
					</tr>
				</table>
				<a href="/lms/student/classBoard/updateMyClassAssignmentForm.jsp?assignmentNo=<%=assignmentNo%>">수정</a>
		<%
			} else {
		%>
				<a href="/lms/student/classBoard/submitMyClassAssignmentForm.jsp?assignmentNo=<%=assignmentNo%>&classApplyNo=<%=assignment.get("classApplyNo")%>">제출</a>
		<%
			}
		%>
	</div>
</body>
</html>
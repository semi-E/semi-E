<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="lms.dao.MyclassDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>    


 <%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>   


<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	System.out.println(studentNo+"<-----studentNo");
%>

<%
	ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/student/include/header.jsp"></jsp:include>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="/student/include/classSidebar.jsp"></jsp:include>
		<div class="main-panel">
			<div class="content-wrapper">
				<table border ="1">
					<tr>
						<td>강의 번호</td>
						<td>강의 이름</td>
						<td>교수 번호</td>
						<td>과목 이름</td>
						<td>요일</td>
						<td>시작 교시</td>
						<td>학점</td>
						<td></td>
					</tr>
					<%
						for(HashMap<String,Object> m : list) {
					%>
						<tr>
							<td><a href="/lms/student/class/myClassOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
							<td><%=m.get("className") %></td>
							<td><%=m.get("professorNo") %></td>
							<td><%=m.get("subjectName") %></td>
							<td><%=m.get("days") %></td>
							<td><%=m.get("periodStart") %></td>
							<td><%=m.get("credit") %></td>
							<td><a href="/lms/student/classApply/deleteMyClassAction.jsp?classApplyNo=<%=m.get("classApplyNo")%>">삭제</a></td>
						</tr>
					<%
						}
					%>
				
				</table>
			</div>
		</div>
	</div>
</body>
</html>
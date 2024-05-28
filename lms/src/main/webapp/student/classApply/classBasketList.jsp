<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%@ page import="java.util.*" %>

 <%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	// 세션에서 정보 가져오기
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	// 장바구니 리스트 호출
	ArrayList<HashMap<String, Object>> selectClassBasketList = ClassBasketDAO.selectClassBasketList(studentNo);
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 목록</title>
</head>
<body>
	<jsp:include page="/student/include/header.jsp"></jsp:include>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="/student/include/classApplySidebar.jsp"></jsp:include>
		<div class="main-panel">
			<div class="content-wrapper">
				<h1>수강신청 목록</h1>
				<table border = 1>
					<tr>
						<th>강의번호</th><th>교수명</th><th>과명</th><th>강의이름</th><th>학점</th>
						<th>요일</th><th>시작교시</th><th>강의실</th><th>년도</th><th>학기</th><th>취소</th>
					</tr>
					<%
						for(HashMap m : selectClassBasketList){
					%>
						<tr>
							<td><%=m.get("classApplyNo") %></td>
							<td><%=m.get("name") %></td>
							<td><%=m.get("subjectName") %></td>
							<td><%=m.get("className") %></td>
							<td><%=m.get("credit") %></td>
							<td><%=m.get("days") %></td>
							<td><%=m.get("periodStart") %></td>
							<td><%=m.get("classroom") %></td>
							<td><%=m.get("year") %></td>
							<td><%=m.get("semester") %></td>
							<td><a href="/lms/student/classApply/deleteClassBasketAction.jsp?classApplyNo=<%=m.get("classApplyNo") %>">취소</a></td>
						</tr>
					<%
						}
					%>
				</table>
				<a href="/lms/student/classApply/classApplyList.jsp">추가 신청</a>
				
				<%
					if(5 <= selectClassBasketList.size() && selectClassBasketList.size() <= 8){
				%>
						<a href="/lms/student/classApply/addMyClassAction.jsp">수강 신청</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
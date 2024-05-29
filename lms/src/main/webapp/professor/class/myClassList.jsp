<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	String paramYear = request.getParameter("year");
	String paramSemester = request.getParameter("semester");
	
	//디버깅
	System.out.println(currentPage + "<-- myClass param currentPage");
	System.out.println(professorNo + "<-- myClass session professorNo");
	System.out.println(paramYear + "<-- myClass param paramYear");
	System.out.println(paramSemester + "<-- myClass param paramSemester");
	
	//년도와 학기는 나중에 그 날의 날짜에 따라서 기본값이 정해지게 변경
	if(paramYear == null || paramYear.equals("")){
		paramYear = "2024";
	}
	int year = Integer.parseInt(paramYear);
	
	if(paramSemester == null || paramSemester.equals("")){
		paramSemester = "1";
	}
	int semester = Integer.parseInt(paramSemester);
	
	// 검색된 class의 개수
	int cnt = ClassOpenApplyDAO.selectClassOpenApplyCount(0, professorNo, "", "", "", "", 0, year, semester, "승인"); 
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = 0;
	
	
	ArrayList<HashMap<String, Object>> classList = ClassOpenApplyDAO.selectClassOpenApplyList(0, professorNo, "", "", "", "", 0, year, semester, "승인", startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
	<jsp:include page="/professor/include/header.jsp"></jsp:include>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="/professor/include/classSidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
				<h1>내 강의 목록</h1>
				<a href="/lms/professor/class/subjectList.jsp">과목 목록</a>
				<a href="/lms/professor/class/classList.jsp">강의 목록</a>
				<a href="/lms/professor/class/classOpenApplyList.jsp">내 강의 신청 목록</a>
				<form method="get" action="/lms/professor/class/myClassList.jsp">
					년도 : <input type="number" step="any" name="year">
					학기 : 
					<select name="semester">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<button type="submit"class="btn btn-primary">검색</button>
				</form>
				<table class="table table-striped">
					<tr>
						<th>강의 번호</th>
						<th>과목 명</th>
						<th>강의 명</th>
						<th>학점</th>
						<th>요일</th>
						<th>시작 교시</th>
						<th>년도</th>
						<th>학기</th>
					</tr>
					<%
						for(HashMap m : classList){
					%>
							<tr>
								<td><%=m.get("classApplyNo") %></td>
								<td><%=m.get("subjectName") %></td>
								<td><%=m.get("className") %></td>
								<td><%=m.get("credit") %></td>
								<td><%=m.get("days") %></td>
								<td><%=m.get("periodStart") %></td>
								<td><%=m.get("year") %></td>
								<td><%=m.get("semester") %></td>
							</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
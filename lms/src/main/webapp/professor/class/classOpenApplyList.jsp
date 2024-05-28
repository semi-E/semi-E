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
	//DAO에 파라미터로 쓰일 빈값(교수번호가 무조건 들어가서 이름이 필요없음)
	String professorName = "";
	String paramClassApplyNo = request.getParameter("classApplyNo");
	String className = request.getParameter("className");
	String subjectName = request.getParameter("subjectName");
	String days = request.getParameter("days");
	String paramPeriodStart = request.getParameter("periodStart");
	String paramYear = request.getParameter("year");
	String paramSemester = request.getParameter("semester");
	
	//디버깅
	System.out.println(currentPage + "<-- classOpenApplyList param currentPage");
	System.out.println(professorNo + "<-- classOpenApplyList session professorNo");
	System.out.println(paramClassApplyNo + "<-- classOpenApplyList param paramClassApplyNo");
	System.out.println(className + "<-- classOpenApplyList param className");
	System.out.println(subjectName + "<-- classOpenApplyList param subjectName");
	System.out.println(days + "<-- classOpenApplyList param days");
	System.out.println(paramPeriodStart + "<-- classOpenApplyList param paramPeriodStart");
	System.out.println(paramYear + "<-- classOpenApplyList param paramYear");
	System.out.println(paramSemester + "<-- classOpenApplyList param paramSemester");
	
	//null 값이 들어왔을때
	if(paramClassApplyNo == null || paramClassApplyNo.equals("")){
		paramClassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(paramClassApplyNo);
	
	if(className == null){
		className = "";
	}
	if(subjectName == null){
		subjectName = "";
	}
	if(days == null){
		days = "";
	}
	
	if(paramPeriodStart == null || paramPeriodStart.equals("")){
		paramPeriodStart = "0";
	}
	int periodStart = Integer.parseInt(paramPeriodStart);
	
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
	int cnt = ClassOpenApplyDAO.selectClassOpenApplyCount(classApplyNo, professorNo, professorName, className, subjectName, days, periodStart, year, semester);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> classList = ClassOpenApplyDAO.selectClassOpenApplyList(classApplyNo, professorNo, professorName, className, subjectName, days, periodStart, year, semester, startRow, rowPerPage);
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
			<h1>강의 신청 목록</h1>
			<a href="/lms/professor/class/addClassOpenApplyForm.jsp">강의 신청</a>
			<form method="get" action="/lms/professor/class/classOpenApplyList.jsp">
				강의 번호 : <input type="number" name="classApplyNo">
				과목 명 : <input type="text"  name="subjectName">
				강의 명 : <input type="text" name="className"><br>
				요일 :
				<select name="days">
					<option value="">선택</option>
					<option value="월">월</option>
					<option value="화">화</option>
					<option value="수">수</option>
					<option value="목">목</option>
					<option value="금">금</option>
				</select>
				시작 교시 : 
				<select name="periodStart">
					<option value="">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>
				년도 : <input type="number" step="any" name="year">
				학기 : 
				<select name="semester">
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				<button type="submit">검색</button>
			</form>
			<table border="1">
				<tr>
					<th>강의 번호</th>
					<th>과목 명</th>
					<th>강의 명</th>
					<th>학점</th>
					<th>요일</th>
					<th>시작 교시</th>
					<th>년도</th>
					<th>학기</th>
					<th>상태</th>
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
							<td><%=m.get("state") %></td>
							<td><a href="/lms/professor/class/deleteClassOpenApplyAction.jsp?classApplyNo=<%=m.get("classApplyNo") %>">삭제</a></td>
						</tr>
				<%
					}
				%>
				
			</table>
			
				<%
				if(currentPage > 1){
			%>
					<a href="/lms/professor/class/classLOpenApplyist.jsp?currentPage=1&classApplyNo=<%=paramClassApplyNo%>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">처음</a>
					<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=currentPage - 1 %>&classApplyNo=<%=paramClassApplyNo %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">이전</a>
			<%
				}
			%>
			
			<%
				if(currentPage < lastPage){
			%>
					<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=currentPage + 1 %>&classApplyNo=<%=paramClassApplyNo %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">다음</a>
					<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=lastPage%>&classApplyNo=<%=paramClassApplyNo %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">마지막</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>
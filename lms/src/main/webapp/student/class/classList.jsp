<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>     
<%
	
%>
 
<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	
	String paramclassApplyNo = request.getParameter("classApplyNo");
	String paramprofessorNo = request.getParameter("studentNo");
	String professorName = request.getParameter("studentName");
	String className = request.getParameter("className");
	String subjectName = request.getParameter("subjectName");
	String days = request.getParameter("days");
	String paramperiodStart = request.getParameter("periodStart");
	String paramyear = request.getParameter("year");
 	String paramsemester = request.getParameter("semester");
	String state = request.getParameter("state");
	
	//디버깅
	System.out.println("paramclassApplyNo: " + paramclassApplyNo);
	System.out.println("paramprofessorNo: " + paramprofessorNo);
	System.out.println("professorName: " + professorName);
	System.out.println("className: " + className);
	System.out.println("subjectName: " + subjectName);
	System.out.println("days: " + days);
	System.out.println("paramperiodStart: " + paramperiodStart);
	System.out.println("paramyear: " + paramyear);
	System.out.println("paramsemester: " + paramsemester);
	System.out.println("state: " + state);
	
 	
	if(paramclassApplyNo == null || paramclassApplyNo.equals("")){
		paramclassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(paramclassApplyNo);
	
	if(paramprofessorNo == null || paramprofessorNo.equals("")){
		paramprofessorNo = "0";
	}
	int professorNo = Integer.parseInt(paramprofessorNo);
	
	if(professorName == null){
		professorName = "";
	}
	
	if(className == null){
		className = "";
	}
	if(subjectName == null){
		subjectName = "";
	}
	if(days == null){
		days = "";
	}
	
	if(paramperiodStart == null || paramperiodStart.equals("")){
		paramperiodStart = "0";
	}
	int periodStart = Integer.parseInt(paramperiodStart);
	
	//년도와 학기는 나중에 그 날의 날짜에 따라서 기본값이 정해지게 변경
	// ex) 20240514, 20240512
	if(paramyear == null || paramyear.equals("")){
		paramyear = "2024";
	}
	int year = Integer.parseInt(paramyear);
	
	if(paramsemester == null || paramsemester.equals("")){
		paramsemester = "1";
	}
	int semester = Integer.parseInt(paramsemester);
	
	ArrayList<HashMap<String, Object>> list = ClassOpenApplyDAO.selectClassOpenApplyList(classApplyNo, professorNo, professorName, className, subjectName, days, periodStart, year, semester, "승인", startRow, rowPerPage);
	//state 매개변수로인해 오류 -> 관리자에게 승인이 완료된 강의 목록을 보여주는 것임으로 state가 "승인" 상태여야 함. 매개변수 말고 값으로 표시.
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
		<jsp:include page="/student/include/classSidebar.jsp"></jsp:include>
		<h1>강의 리스트</h1>
		
		<form method="get" action="/lms/student/class/classList.jsp">
			강의번호:<input type="text" name = "classApplyNo">
			교수번호:<input type="text" name = "professorNo">
			강의이름:<input type="text" name = "className">
			과목이름:<input type="text" name = "subjectName">
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
		
			<button type="submit">검색</button>
			
		</form>
		
		
		
		
		<table border = "1">
			<tr>
				<th>강의 번호</th>
				<th>교수 번호</th>
				<th>교수 이름</th>
				<th>과목 명</th>
				<th>강의 명</th>
				<th>학점</th>
				<th>요일</th>
				<th>시작 교시</th>
				<th>강의실</th>
				<th>년도</th>
				<th>학기</th>
				
			</tr>
			
			<%
				for(HashMap<String,Object> m : list) {
			%>
				<tr>
					<td><%=m.get("classApplyNo")%></td>
					<td><%=m.get("professorNo")%></td>
					<td><%=m.get("professorName")%></td>
					<td><%=m.get("subjectName")%></td>
					<td><%=m.get("className")%></td>
					<td><%=m.get("credit")%></td>
					<td><%=m.get("days")%></td>
					<td><%=m.get("periodStart")%></td>
					<td><%=m.get("classroom")%></td>
					<td><%=m.get("year")%></td>
					<td><%=m.get("semester")%></td>
				</tr>
			
			
			<% 	
				}	
			%>
		
		
		</table>
	</div>
	
</body>
</html>
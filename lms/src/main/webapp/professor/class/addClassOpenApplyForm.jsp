<%@page import="lms.dao.SubjectDAO"%>
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
	ArrayList<HashMap<String, Object>> list = SubjectDAO.selectSubjectList();
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
		<h1>강의 신청</h1>
		<form method="post" action="/lms/professor/class/addClassOpenApplyAction.jsp">
			<!-- DAO로 과목 리스트 뽑아와서 select 사용해서 만들기 -->
			과목 명 : 
			<select name="department">
				<%
					for(HashMap m : list){
				%>
						<option value=<%=m.get("subjectName") %>><%=m.get("subjectName") %></option>
				<%
					}
				%>
			</select><br>
			강의 명 : <input type="text" name="className" required><br>
			요일 :
			<select name="days">
				<option value="월">월</option>
				<option value="화">화</option>
				<option value="수">수</option>
				<option value="목">목</option>
				<option value="금">금</option>
			</select><br>
			시작 교시 : 
			<select name="periodStart">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select><br>
			<!-- 년도 학기는 현재 날짜에 따라 신청 가능여부 판단 -->
			년도 : <input type="number" step="any" name="year" required><br>
			학기 : 
			<select name="semester">
				<option value="1">1</option>
				<option value="2">2</option>
			</select><br>
			<button type="submit">신청</button>
		</form>
	</div>
</body>
</html>
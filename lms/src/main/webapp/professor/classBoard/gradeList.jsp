<%@page import="lms.dao.GradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AttendanceDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

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
	
	String ParamClassApplyNo = request.getParameter("classApplyNo");
	String ParamStudentNo = request.getParameter("studentNo");
	String name = request.getParameter("name");
	String className = request.getParameter("className");
	
	//디버깅
	System.out.println(ParamClassApplyNo + "<-- gradeList param classApplyNo");
	System.out.println(ParamStudentNo + "<-- gradeList param studentNo");
	System.out.println(name + "<-- gradeList param name");
	System.out.println(className + "<-- gradeList param className");

	if(ParamClassApplyNo == null || ParamClassApplyNo.equals("")){
		ParamClassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(ParamClassApplyNo);
	
	if(ParamStudentNo == null || ParamStudentNo.equals("")){
		ParamStudentNo = "0";
	}
	int studentNo = Integer.parseInt(ParamStudentNo);
	
	if(name == null){
		name = "";
	}
	
	if(className == null){
		className = "";
	}
	
	// 검색된 class의 개수
	int cnt = GradeDAO.selectGradeCount(classApplyNo, studentNo, name, className);
	System.out.println(cnt);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>>list = GradeDAO.selectGradeList(classApplyNo, studentNo, name, className, startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 목록</title>
</head>
<body>
	<h1>전체 강의 목록</h1>
	<form method="get" action="/lms/professor/classBoard/gradeList.jsp">
		
		강의번호 : <input type="number" name="classApplyNo">
		학번 : <input type="number" name= "studentNo">
		이름 : <input type="text"  name="name" size=10>
		강의명 : <input type="text"  name="className" size=10>
		<button type="submit">검색</button>
	</form>
	<table border="1">
		<tr>
			<th>강의번호</th>
			<th>과목명</th>
			<th>학번</th>
			<th>이름</th>
			<th>중간고사</th>
			<th>기말고사</th>
			<th>수정</th>
		</tr>
		<%
			for(HashMap m : list){
		%>
		<tr>
			<form method="get" action="/lms/professor/classBoard/updateGradeAction.jsp">
				<td><input type="number" value="<%=m.get("classApplyNo") %>" name = "classApplyNo" readonly></td>
				<td><input type="text" value="<%=m.get("className") %>" name = "className" readonly></td>
				<td><input type="number" value="<%=m.get("studentNo") %>" name = "studentNo" readonly></td>
				<td><input type="text" value="<%=m.get("name") %>" name = "name" readonly></td>
				<td><input type="number" value="<%=m.get("midExam") %>" placeholder="<%=m.get("midExam") %>" name = "midExam"> </td>
				<td><input type="number" value="<%=m.get("finalExam") %>" placeholder="<%=m.get("finalExam") %>" name = "finalExam"> </td>
				<td><button type="submit">수정</button></td>
			</form>
		</tr>
		<%
			}
		%>
		
	</table>
	
	<%
		if(currentPage > 1){
	%>
			<a href="/lms/professor/classBoard/gradeList.jsp?currentPage=1&classApplyNo=<%=classApplyNo%>&studentNo=<%=studentNo%>&name=<%=name%>&className=<%=className%>">처음</a>
			<a href="/lms/professor/classBoard/gradeList.jsp?currentPage=<%=currentPage - 1 %>&studentNo=<%=studentNo%>&name=<%=name%>&className=<%=className%>">이전</a>
	<%
		}
	%>
	
	<%
		if(currentPage < lastPage){
	%>
			<a href="/lms/professor/classBoard/gradeList.jsp?currentPage=<%=currentPage + 1 %>&studentNo=<%=studentNo%>&name=<%=name%>&className=<%=className%>">다음</a>
			<a href="/lms/professor/classBoard/gradeList.jsp?currentPage=<%=lastPage%>&studentNo=<%=studentNo%>&name=<%=name%>&className=<%=className%>">마지막</a>
	<%
		}
	%>
</body>
</html>
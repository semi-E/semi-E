<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
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
	//파라미터
	//검색에서 예외처리를 하기 위해서 String 값으로 받아줌
	String paramClassApplyNo = request.getParameter("classApplyNo");
	String ParmaProfessorNo =  request.getParameter("professorNo");
	String professorName = request.getParameter("professorName");
	String subjectName = request.getParameter("subjectName");
	String className = request.getParameter("className");
	String days = request.getParameter("days");
	String paramPeriodStart=request.getParameter("periodStart");
	String paramYear = request.getParameter("year");
	String paramSemester = request.getParameter("semester");
	//디버깅
	System.out.println(currentPage + "<-- classOpenApplyList.jsp param currentPage");
	System.out.println(paramClassApplyNo +"classOpenApplyList.jsp param classApplyNo");
	System.out.println(ParmaProfessorNo +"classOpenApplyList.jsp param professorNo");
	System.out.println(professorName +"classOpenApplyList.jsp param professorName");
	System.out.println(subjectName +"classOpenApplyList.jsp param subjectName");
	System.out.println(className + "<-- classOpenApplyList param className");
	System.out.println(days +"classOpenApplyList.jsp param days");
	System.out.println(paramPeriodStart +"classOpenApplyList.jsp param periodStart");
	System.out.println(paramYear + "<-- classOpenApplyList param paramYear");
	System.out.println(paramSemester + "<-- classOpenApplyList param paramSemester");
	
	//검색에서 null 값이 들어왔을때
		if(paramClassApplyNo == null || paramClassApplyNo.equals("")){
			paramClassApplyNo = "0";
		}
		int classApplyNo = Integer.parseInt(paramClassApplyNo);
		
		
		if(ParmaProfessorNo == null || ParmaProfessorNo.equals("")){
			ParmaProfessorNo = "0";
		}
		int professorNo = Integer.parseInt(ParmaProfessorNo);
		
		if(className == null){
			className = "";
		}
		
		if(professorName == null){
			professorName = "";
		}
		if(subjectName == null){
			subjectName = "";
		}
		if(className == null){
			className = "";
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
    <title></title>
</head>	
<body>
    <div class="container-scroller">
        <jsp:include page="/admin/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/admin/include/classListSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">강의 신청 목록</h1>
				<a href="/lms/admin/subjects/classList.jsp">승인 신청된 강의 리스트 가기</a>
				<form method="get" action="/lms/admin/subjects/classOpenApplyList.jsp">
					강의 번호 : <input type="number" name="classApplyNo" class="form-control">
					과목 명 : <input type="text"  name="subjectName" class="form-control">
					강의 명 : <input type="text" name="className" class="form-control"><br>
					요일 :
					<select name="days"  class="form-control">
						<option value="">선택</option>
						<option value="월">월</option>
						<option value="화">화</option>
						<option value="수">수</option>
						<option value="목">목</option>
						<option value="금">금</option>
					</select>
					시작 교시 : 
					<select name="periodStart"  class="form-control">
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
					년도 : <input type="number" step="any" name="year"  class="form-control">
					학기 : 
					<select name="semester"  class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
					<button type="submit" class="btn btn-primary mt-3">검색</button>
				</form>
				<table border="1" class="table table-bordered">
					<tr>
						<th>강의 번호</th>
						<th>교수 번호</th>
						<th>교수 명</th>
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
								<td><%=m.get("professorNo") %></td>
								<td><%=m.get("professorName") %></td>
								<td><%=m.get("subjectName") %></td>
								<td><%=m.get("className") %></td>
								<td><%=m.get("credit") %></td>
								<td><%=m.get("days") %></td>
								<td><%=m.get("periodStart") %></td>
								<td><%=m.get("year") %></td>
								<td><%=m.get("semester") %></td>
								<td><%=m.get("state") %></td>
								<td><a href="/lms/admin/subjects/classOpenApplyOne.jsp?classApplyNo=<%=m.get("classApplyNo")%>&professorNo=<%=m.get("professorNo")%>">상세보기</a></td>
							</tr>
					<%
						}
					%>
					
				</table>
				
						<%
					if(currentPage > 1){
				%>
						<a href="/lms/professor/class/classLOpenApplyist.jsp?currentPage=1&classApplyNo=<%=paramClassApplyNo%>&professorNo=<%=professorNo%>&professorName=<%=professorName%>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">처음</a>
						<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=currentPage - 1 %>&classApplyNo=<%=paramClassApplyNo %>&professorNo=<%=professorNo%>&professorName=<%=professorName%>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">이전</a>
				<%
					}
				%>
				
				<%
					if(currentPage < lastPage){
				%>
						<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=currentPage + 1 %>&classApplyNo=<%=paramClassApplyNo %>&professorNo=<%=professorNo%>&professorName=<%=professorName%>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">다음</a>
						<a href="/lms/professor/class/classOpenApplyList.jsp?currentPage=<%=lastPage%>&classApplyNo=<%=paramClassApplyNo %>&professorNo=<%=professorNo%>&professorName=<%=professorName%>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">마지막</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
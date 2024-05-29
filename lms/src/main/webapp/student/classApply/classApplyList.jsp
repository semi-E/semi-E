<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	String paramClassApplyNo = request.getParameter("classApplyNo");
	String paramProfessorNo = request.getParameter("professorNo");
	String professorName = request.getParameter("professorName");
	String className = request.getParameter("className");
	String subjectName = request.getParameter("subjectName");
	String days = request.getParameter("days");
	String paramPeriodStart = request.getParameter("periodStart");
	String paramYear = request.getParameter("year");
	String paramSemester = request.getParameter("semester");
	
	//디버깅
	System.out.println(currentPage + "<-- classList param currentPage");
	System.out.println(paramClassApplyNo + "<-- classList param paramClassApplyNo");
	System.out.println(paramProfessorNo + "<-- classList param paramProfessorNo");
	System.out.println(professorName + "<-- classList param professorName");
	System.out.println(className + "<-- classList param className");
	System.out.println(subjectName + "<-- classList param subjectName");
	System.out.println(days + "<-- classList param days");
	System.out.println(paramPeriodStart + "<-- classList param paramPeriodStart");
	System.out.println(paramYear + "<-- classList param paramYear");
	System.out.println(paramSemester + "<-- classList param paramSemester");
	
	//null 값이 들어왔을때
	if(paramClassApplyNo == null || paramClassApplyNo.equals("")){
		paramClassApplyNo = "0";
	}
	int classApplyNo = Integer.parseInt(paramClassApplyNo);
	
	if(paramProfessorNo == null || paramProfessorNo.equals("")){
		paramProfessorNo = "0";
	}
	int professorNo = Integer.parseInt(paramProfessorNo);
	
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
	int cnt = ClassOpenApplyDAO.selectClassOpenApplyCount(classApplyNo, professorNo, professorName, className, subjectName, days, periodStart, year, semester, "승인");
	System.out.println(cnt);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> classList = ClassOpenApplyDAO.selectClassOpenApplyList(classApplyNo, professorNo, professorName, className, subjectName, days, periodStart, year, semester, "승인", startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수강 신청</title>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/classApplySidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">전체 강의목록</h1>
                <form method="get" action="/lms/student/classApply/classApplyList.jsp">
					강의 번호 : <input type="number" name="classApplyNo" class="form-control">
					교수 번호 : <input type="number" name="professorNo" class="form-control">
					교수 이름 : <input type="text"  name="professorName" class="form-control">
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
					<button type="submit" class="btn btn-primary">검색</button>
				</form>
				<table border="1" class="table table-striped table-borderless">
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
						<th>신청</th>
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
								<td><%=m.get("classroom") %></td>
								<td><%=m.get("year") %></td>
								<td><%=m.get("semester") %></td>
								<td><a href="/lms/student/classApply/addClassBasketAction.jsp?classApplyNo=<%=m.get("classApplyNo")%>">신청</a></td>
							</tr>
					<%
						}
					%>
					
				</table>
                    <button type="submit" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	
				<%
					if(currentPage > 1){
				%>
						<a href="/lms/professor/class/classList.jsp?currentPage=1&classApplyNo=<%=paramClassApplyNo %>&professrNo=<%=paramProfessorNo %>&professorName=<%=professorName %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">처음</a>
						<a href="/lms/professor/class/classList.jsp?currentPage=<%=currentPage - 1 %>&classApplyNo=<%=paramClassApplyNo %>&professrNo=<%=paramProfessorNo %>&professorName=<%=professorName %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">이전</a>
				<%
					}
				%>
				
				<%
					if(currentPage < lastPage){
				%>
						<a href="/lms/professor/class/classList.jsp?currentPage=<%=currentPage + 1 %>&classApplyNo=<%=paramClassApplyNo %>&professrNo=<%=paramProfessorNo %>&professorName=<%=professorName %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">다음</a>
						<a href="/lms/professor/class/classList.jsp?currentPage=<%=lastPage%>&classApplyNo=<%=paramClassApplyNo %>&professrNo=<%=paramProfessorNo %>&professorName=<%=professorName %>&className=<%=className%>&subjectName=<%=subjectName%>&days=<%=days%>&periodStart=<%=paramPeriodStart%>&year=<%=year%>&semester=<%=semester%>">마지막</a>
				<%
					}
				%>
		</div>
	</div>
	
</body>
</html>
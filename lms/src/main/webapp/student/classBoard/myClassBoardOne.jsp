<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="lms.dao.MyclassDAO"%>
<%@page import="java.util.*"%>
<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%

	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	System.out.println(classApplyNo+"<-----classApplyNo");
	
	
	
	HashMap<String, Object> m = MyclassDAO.selectMyClass(classApplyNo);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/classBoardSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">강의 상세보기</h1>
                	<table border ="1" class="table table-striped table-borderless">
				<tr>
					<td>강의번호</td>
					<td><%=m.get("classApplyNo") %></td>
				</tr>	
				
				<tr>
					<td>과목이름</td>
					<td><%=m.get("subjectName") %></td>
				</tr>	
				<tr>
					<td>교수번호</td>
					<td><%=m.get("professorNo") %></td>
				</tr>	
				
				<tr>
					<td>강의 이름</td>
					<td><%=m.get("className") %></td>
				</tr>	
				<tr>	
					<td>시작교시</td>
					<td><%=m.get("periodStart") %></td>		
				</tr>	
				
				<tr>	
					<td>요일</td>
					<td><%=m.get("days") %></td>		
				</tr>	
			
				<tr>	
					<td>상태</td>
					<td><%=m.get("state") %></td>				
				</tr>	
				
				<tr>	
					<td>강의실</td>
					<td><%=m.get("classroom") %></td>		
				</tr>	
				
				<tr>	
					<td>년도</td>
					<td><%=m.get("year") %></td>		
				</tr>	
				
				<tr>	
					<td>학기</td>
					<td><%=m.get("semester") %></td>		
				</tr>
			</table>
		<a href="/lms/student/classBoard/attendanceList.jsp?classApplyNo=<%=m.get("classApplyNo")%>&studnetNo<%=m.get("studnetNo")%>">출석</a>	
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
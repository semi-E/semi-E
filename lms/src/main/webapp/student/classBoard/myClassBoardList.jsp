<%@page import="lms.dao.MyclassDAO"%>
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
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//디버깅
	System.out.println(studentNo+"<-- studentNo");
	
	ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo);
	
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지 수정</title>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <div class="container mt-5">
                <h1 class="mb-4">내 강의게시판 목록</h1>
               <table border="1"  class="table table-striped table-borderless">
				<tr>
					<th>강의 번호</th>
					<th>학과 이름</th>
					<th>교수 번호</th>
					<th>강의명</th>
					<th>시작교시</th>
					<th>요일</th>
					<th>강의실</th>
					<th>년도</th>
					<th>학기</th>
					<th>학점</th>
				</tr>
				<%
					for(HashMap m : list){
				%>
						<tr>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("subjectName") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("professorNo") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("className") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("periodStart") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("days") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classroom") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("year") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("semester") %></a></td>
							<td><a href="/lms/student/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("credit") %></a></td>
						</tr>
				<%
					}
				%>
				
			</table>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
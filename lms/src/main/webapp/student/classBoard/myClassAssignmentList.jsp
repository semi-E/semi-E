<%@page import="lms.dao.AssignmentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
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
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	//디버깅
	System.out.println(currentPage + "<-- myClassAssignmentList param currentPage");
	System.out.println(classApplyNo + "<-- myClassAssignmentList param classApplyNo");
	
	// 검색된 assignment의 개수
	int cnt = AssignmentDAO.selectAssignmentCount(classApplyNo);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> assignmentList = AssignmentDAO.selectAssignmentList(classApplyNo,startRow, rowPerPage);
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
                <h1 class="mb-4">과제 목록</h1>
               	<table border="1"  class="table table-striped table-borderless">
				<tr>
					<th>제목</th>
					<th>생성날짜</th>
					<th>제출기한</th>
				</tr>
				<%
					for(HashMap m : assignmentList){
				%>
						<tr>
							<td><a href="/lms/student/classBoard/myClassAssignmentOne.jsp?assignmentNo=<%=m.get("assignmentNo")%>&classApplyNo=<%=classApplyNo%>"><%=m.get("title") %></a></td>
							<td><%=m.get("createDate") %></td>
							<td><%=m.get("endDate") %></td>
						</tr>
				<%
					}
				%>
			</table>
		
        </div>
    </div>
			<%
				if(currentPage > 1){
			%>
					<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=1&classApplyNo=<%=classApplyNo%>">처음</a>
					<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=currentPage - 1 %>&classApplyNo=<%=classApplyNo%>">이전</a>
			<%
				}
			%>
			
			<%
				if(currentPage < lastPage){
			%>
					<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=currentPage + 1 %>&classApplyNo=<%=classApplyNo%>">다음</a>
					<a href="/lms/student/classBoard/myClassAssignmentList.jsp?currentPage=<%=lastPage %>&classApplyNo=<%=classApplyNo%>">마지막</a>
			<%
				}
			%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>

			
		</div>
	</div>
</body>
</html>
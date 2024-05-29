<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>       
<%@ page import = "lms.dao.*" %>   

<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
	
<%
	int studentNo = 20240102; //Integer.parseInt(request.getParameter("studentNo"));
	int classApplyNo = 3; // Integer.parseInt(request.getParameter("classApplyNo"));
	
	System.out.println(studentNo+"<------studentNo");
	System.out.println(classApplyNo+"<------classApplyNo");
	
	//DAO
	 ArrayList<HashMap<String, Object>> list = GradeDAO.selectGradeList1(studentNo, classApplyNo);
	
	
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
            <jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">성적 리스트</h1>
                	<table border = "1" class="table table-striped table-borderless">
				<tr>
					<td>학생번호</td>
					<td>중간고사</td>
					<td>기말고사</td>
					<td>출석</td>
					<td>과제</td>
					<td>전체성적</td>
				</tr>
				
				<%
					for(HashMap m : list){
				%>
					<tr>
						<td><%=m.get("studentNo") %></td>
						<td><%=m.get("midexam") %></td>
						<td><%=m.get("finalexam") %></td>
						<td><%=m.get("attendanceScore") %></td>
						<td><%=m.get("assignmentScore") %></td>
						<td><%=m.get("totalScore") %></td>
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
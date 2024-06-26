<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AssignmentDAO"%>
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
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));

	System.out.println(assignmentNo+"<------assignmentNo");
	System.out.println(classApplyNo+"<------classApplyNo");

	HashMap<String, Object> m = AssignmentDAO.selectAssignment(assignmentNo);
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
			<jsp:include page="/professor/include/classBoardSidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="content-wrapper">
					 <div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h1>과제 상세보기</h1>
									<table class="table table-striped">
										<tr>
											<td>과제번호</td>
											<td><%=assignmentNo%></td>
										</tr>
										
										<tr>
											<td>강의번호</td>
											<td><%=m.get("classApplyNo")%></td>
										</tr>	
										
										<tr>
											<td>제목</td>
											<td><%=m.get("title")%></td>
										</tr>	
										
										<tr>
											<td>내용</td>
											<td><%=m.get("content")%></td>
										</tr>	
										
										<tr>
											<td>생성날짜</td>
											<td><%=m.get("createDate")%></td>
										</tr>	
										
										<tr>
											<td>종료날짜</td>
											<td><%=m.get("endDate")%></td>
										</tr>		
											
								
									</table>
									
									
									<a href ="/lms/professor/classBoard/updateAssignmentForm.jsp?classApplyNo=<%=request.getParameter("classApplyNo") %>&assignmentNo=<%=assignmentNo%>"><button class="btn btn-primary">과제수정</button></a>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>















	


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*"%>    
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	System.out.println(classApplyNo+"<-- classApplyNo");
	
	//상세보기 정보 호출
	HashMap<String, Object> m = ClassOpenApplyDAO.selecMyClassOpenApply(classApplyNo, professorNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
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
								<h1>내 강의 상세보기</h1>
								<table class="table table-striped">
									<tr>
										<td>과목명</td>
										<td><%=m.get("subjectName") %></td>
									</tr>	
									
									<tr>
										<td>강의명</td>
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
										<td>생성날짜</td>
										<td><%=m.get("createDate") %></td>		
									</tr>	
									
									<tr>	
										<td>수정날짜</td>
										<td><%=m.get("updateDate") %></td>		
									</tr>	
								
									<tr>	
										<td>관리자번호</td>
										<td><%=m.get("adminNo") %></td>				
									</tr>	
								</table>
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
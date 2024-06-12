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
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/professor/include/classSidebar.jsp"></jsp:include>
			<div class="main-panel">
					<div class="content-wrapper">
					 <div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h1>강의 신청</h1>
									<form method="post" action="/lms/professor/class/addClassOpenApplyAction.jsp">
										<!-- DAO로 과목 리스트 뽑아와서 select 사용해서 만들기 -->
										<table class="table table-striped">
											<tr>
												<td>과목 명 : </td>
												<td>
													<select name="department">
														<%
															for(HashMap m : list){
														%>
																<option value=<%=m.get("subjectName") %>><%=m.get("subjectName") %></option>
														<%
															}
														%>
													</select>
												</td>
											</tr>
											<tr>
												<td>
													강의 명 :
												</td>
												<td>
													<input type="text" name="className" required>
												</td>
											</tr>
											<tr>
												<td>
													요일 :
												</td>
												<td>
													<select name="days">
														<option value="월">월</option>
														<option value="화">화</option>
														<option value="수">수</option>
														<option value="목">목</option>
														<option value="금">금</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>
													시작 교시 : 
												</td>
												<td>
													<select name="periodStart">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
													</select>
												</td>
											</tr>
											<!-- 년도 학기는 현재 날짜에 따라 신청 가능여부 판단 -->
											<tr>
												<td>
													년도 :
												</td>
												<td> 
													<input type="number" step="any" name="year" required>
												</td>
											</tr>
											<tr>
												<td>
													학기 :
												</td>
												<td> 
													<select name="semester">
														<option value="1">1</option>
														<option value="2">2</option>
													</select>
												</td>
											</tr>
										</table>
										<button type="submit" class="btn btn-primary">신청</button>
									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
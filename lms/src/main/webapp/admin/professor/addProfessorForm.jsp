<%@page import="lms.dao.DepartmentDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	ArrayList<HashMap<String, Object>> departmentList = DepartmentDAO.selectDepartmentList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
		<jsp:include page="/admin/include/adminListSidebar.jsp"></jsp:include>
		<div class="main-panel">
			<div class="content-wrapper">
				<h1>교수 등록</h1>
				<form method="post" action="/lms/admin/professor/addProfessorAction.jsp">
					<!-- javascript로 최소 글자 9자로 지정할수있게 나중에 해야함, 첫글자는 무조건2, 6~7은 학과에 맞게 -->
					교수 번호<input type="text" name="professorNo"  maxlength="9" required><br>
					교수 이름<input type="text" name="name" required><br>
					<!--  학과 리스트를 받아와서 select로 변경할수도있음 -->
					학과
					<select name="department">
						<%
							for(HashMap m : departmentList){
						%>
								<option value=<%=m.get("department") %>><%=m.get("department") %></option>
						<%
							}
						%>
					</select><br>
					<button type="submit">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
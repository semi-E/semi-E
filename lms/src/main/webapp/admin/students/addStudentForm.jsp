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
    <title></title>
</head>	
<body>
    <div class="container-scroller">
        <jsp:include page="/admin/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/admin/include/adminListSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">학생 추가</h1>
		<form method="post" action="/lms/admin/students/addStudentAction.jsp">
                    <div>
                        <label for="studentNo">학생 번호</label>
                        <input type="text" name="studentNo" id="studentNo"  class="form-control">
                    </div>
		
                    <div>
                        <label for="name">이름</label>
                        <input type="text" name="name" id="name"  class="form-control">
                    </div>

                    <div>
                        <label for="department">학과</label>
                        <select name="department"  class="form-control">
                            <%
					for(HashMap m : departmentList){
				%>
                            <option value=<%=m.get("department") %>><%=m.get("department") %></option>
                            <%
					}
				%>
                        </select>
                    </div>

                    <div><button type="submit"  class="btn btn-primary mt-3">학생추가</button></div>
                </form>		
			
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>


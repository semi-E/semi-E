<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.ProfessorDAO"%>
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
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	String paramProfessorNo = request.getParameter("professorNo");
	String department = request.getParameter("department");
	String name = request.getParameter("name");
	
	//디버깅
	System.out.println(currentPage + "<-- professorList param currentPage");
	System.out.println(paramProfessorNo + "<-- professorList param paramProfessorNo");
	System.out.println(department + "<-- professorList param department");
	System.out.println(name + "<-- professorList param name");
	
	if(paramProfessorNo == null || paramProfessorNo.equals("")){
		paramProfessorNo = "0";
	}
	int professorNo = Integer.parseInt(paramProfessorNo);
	
	if(department == null){
		department = "";
	}
	
	if(name == null){
		name = "";
	}
	
	int cnt = ProfessorDAO.selectProfessorCount(professorNo, department, name);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	ArrayList<HashMap<String, Object>> professorList = ProfessorDAO.selectProfessorList(professorNo, department, name, startRow, rowPerPage);
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
                <h1 class="mb-4">교수 목록</h1>
              	<a href="/lms/admin/professor/addProfessorForm.jsp">교수 등록</a>
				<form method="get" action="/lms/admin/professor/professorList.jsp">
					번호 :<input type="text" name="professorNo" class="form-control">
					이름 : <input type="text" name="name" class="form-control">
					학과 : <input type="text" name="department" class="form-control">
					<button type="submit" class="btn btn-primary mt-3">검색</button>	
				</form>
				<table border="1" class="table table-bordered">
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>학과</th>
						<th>상태</th>
					</tr>
					<%
						for(HashMap<String, Object> m : professorList){
					%>
							<tr>
								<td><a href="/lms/admin/professor/professorOne.jsp?professorNo=<%=m.get("professorNo")%>"><%=m.get("professorNo") %></a></td>
								<td><%=m.get("name") %></td>
								<td><%=m.get("department") %></td>
								<td><%=m.get("state") %></td>
							</tr>
					<%
						}
					
						//페이징 추가 필요
					%>
					
				</table>
				
				<%
					if(currentPage > 1){
				%>
						<a href="/lms/admin/professor/professorList.jsp?currentPage=1&professrNo=<%=professorNo%>&name=<%=name%>&department=<%=department%>">처음</a>
						<a href="/lms/admin/professor/professorList.jsp?currentPage=<%=currentPage - 1 %>&professrNo=<%=professorNo%>&name=<%=name%>&department=<%=department%>">이전</a>
				<%
					}
				%>
				
				<%
					if(currentPage < lastPage){
				%>
						<a href="/lms/admin/professor/professorList.jsp?currentPage=<%=currentPage + 1 %>&professrNo=<%=professorNo%>&name=<%=name%>&department=<%=department%>">다음</a>
						<a href="/lms/admin/professor/professorList.jsp?currentPage=<%=lastPage%>&professrNo=<%=professorNo%>&name=<%=name%>&department=<%=department%>">마지막</a>
				<%
					}
				%>
			
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>

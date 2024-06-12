<%@page import="lms.dao.AttendanceDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	//student/classBoard/myClassBoardOne.jsp ->강의번호별 출석을 볼수있음
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo")); // 수강하고있는 강의의 번호 - 강의에 따라서 출석이 다름
	

	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//디버깅
	System.out.println(classApplyNo + "<-- attendanceList param classApplyNo");
	
	ArrayList<HashMap<String, Object>> attendanceList = AttendanceDAO.selectAttendanceList(classApplyNo, studentNo);
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
                <h1 class="mb-4">출석 리스트</h1>
                <table border="1"  class="table table-striped table-borderless">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<%
						for(int i = 1; i < 16; i++){
					%>
						<th><%=i %>주차</th>
					<%
						}
					%>
				</tr>
				<tr>
					<%
						int index = 1;
						for(HashMap m : attendanceList){
							if(index % 15 == 1){
					%>
								<td>
									<%=m.get("studentNo") %>
								</td>
								<td><%=m.get("name") %>
					<%				
							}
					%>
							<td><%=m.get("state") %></td>
					<%
							if(index % 15 == 0){
					%>
								</tr>
								<tr>
					<%
							}
							index++;
						}
					%>
				</tr>
			</table>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
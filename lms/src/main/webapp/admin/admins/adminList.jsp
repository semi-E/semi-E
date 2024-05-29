<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*"%>
<%@ page import="java.util.*"%>

<%
// 세션인증분기 - loginAdmin 관리자
if (session.getAttribute("loginAdmin") == null) {
	response.sendRedirect("/lms/loginForm.jsp");
	return;
}
%>
<%
HashMap<String, Object> sessionInfo = (HashMap<String, Object>) (session.getAttribute("loginAdmin"));
String grade = (String) (sessionInfo.get("grade"));

if (!grade.equals("마스터")) {
	response.sendRedirect("/lms/loginForm.jsp");
	return;
}
%>

<%
ArrayList<HashMap<String, Object>> selectAdminList = AdminDAO.selectAdminList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page="/admin/include/noticeSidebar.jsp"></jsp:include>
		<div class="main-panel">
			<div class="content-wrapper">
				<table border=1>
					<tr>
						<td>관리자번호</td>
						<td>이름</td>
						<td>성별</td>
						<td>생일</td>
						<td>핸드폰번호</td>
						<td>주소</td>
						<td>이메일</td>
						<td>등급</td>
						<td>삭제</td>
					</tr>
		
					<%
					for (HashMap m : selectAdminList) {
					%>
					<tr>
						<td><%=(String) (m.get("admin_no"))%></td>
						<td><%=(String) (m.get("name"))%></td>
						<td><%=(String) (m.get("gender"))%></td>
						<td><%=(String) (m.get("birthday"))%></td>
						<td><%=(String) (m.get("phone"))%></td>
						<td><%=(String) (m.get("address"))%></td>
						<td><%=(String) (m.get("email"))%></td>
						<td><%=(String) (m.get("grade"))%></td>
						<td><a
							href="/lms/admin/admins/deleteAdminAction.jsp?adminNo=<%=(String) (m.get("admin_no"))%>">삭제</a>
						</td>
					<tr>
		
						<%
						}
						%>
					
				</table>
				<a href="/lms/admin/admins/addAdminForm.jsp">관리자 추가</a>
			</div>
		</div>
	</div>
</body>
</html>
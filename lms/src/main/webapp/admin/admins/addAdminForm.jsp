<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	String grade = (String)(sessionInfo.get("grade"));
	
	
	if(!grade.equals("마스터")){
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/admin/include/adminListSidebar.jsp"></jsp:include>
		<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<form method="get" action="/lms/admin/admins/addAdminAction.jsp">
			<div>
				<input type="text" name = "adminNo" placeholder="관리자 번호">
			</div>
			<div>
				<select name="grade">
				    <option value="마스터">마스터</option>
				    <option value="서브">서브</option>
				  </select>
			</div>
			<div>
				<input type="text" name = "name" placeholder="이름" >
			</div>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>
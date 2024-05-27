<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//세션인증분기 - loginProfessor 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="/student/include/header.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
			<h1>학생 비밀번호 변경</h1>
			<form method="post" action="/lms/student/updatePwAction.jsp">
		
				<table>
					<tr>
						<td>이전 비밀번호:<input type="password" name="oldpw"></td>
						<td>새 비밀번호:<input type="password" name="newpw"></td>
					</tr>
		
					<tr>
						<td><button type ="submit">비밀번호 변경</button></td>
					</tr>
		
				</table>
		
		
			</form>
		</div>
	</div>


</body>
</html>
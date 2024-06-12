<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>     
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
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
            <jsp:include page="/admin/include/myPageSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">비밀번호 재설정</h1>
		<form method="post" action="/lms/admin/updatePwAction.jsp">
							<div>
								예전 비밀번호: <input type="password" name = "oldPw"  class="form-control">
							</div>
							<div>
								새 비밀번호: <input type="password" name = "newPw"  class="form-control">
							</div>
						<button type="submit" class="btn btn-primary mt-3">제출</button>
					</form>
				<a href="/lms/admin/updatePwForm.jsp" class="btn btn-primary mt-3">비밀번호 변경</a>		
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
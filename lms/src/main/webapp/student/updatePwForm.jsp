<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 세션인증분기 - loginProfessor 학생
    if(session.getAttribute("loginStudent") == null) {
        response.sendRedirect("/lms/loginForm.jsp");
        return;
    }
%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학생 비밀번호 변경</title>
    <style>
        .container-scroller {
            display: flex;
        }
        .sidebar {
            width: 250px;
            flex-shrink: 0;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
            <div class="main-content">
                <h1 class="mb-4">학생 비밀번호 변경</h1>
                <form method="post" action="/lms/student/updatePwAction.jsp" class="mb-4">
                   <div class="form-group">
					    <label for="oldpw">이전 비밀번호</label>
					    <input type="password" class="form-control" id="oldpw" name="oldpw" style="width: 50%;">
					</div>
					<div class="form-group">
					    <label for="newpw">새 비밀번호</label>
					    <input type="password" class="form-control" id="newpw" name="newpw" style="width: 50%;">
					</div>
                    <button type="submit" class="btn btn-primary mt-3">비밀번호 변경</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
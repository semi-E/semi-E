<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.NoticeDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
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
            <jsp:include page="/admin/include/noticeSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">공지 추가하기</h1>
					<form action="/lms/admin/notice/addNoticeAction.jsp" method="post">
						<div>
							<label for="title">제목</label>
							<input type="text" name="title" id="title" class="form-control" >
						</div>
						<div>
							<label for="content">내용</label>
							<textarea  name="content" id="content" class="form-control" ></textarea>
						</div>
					<button type="submit"  class="btn btn-primary mt-3">공지 추가하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
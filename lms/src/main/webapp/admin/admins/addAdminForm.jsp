<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가</title>
</head>
<body>
	<form method="post" action="/lms/admin/admins/addAdminAction.jsp">
		<div>
			<input type="text" name = "adminNo" placeholder="관리자 번호">
		</div>
		<div>
			<input type="text" name = "grade" placeholder="등급">
		</div>
		<div>
			<input type="text" name = "name" placeholder="이름" >
		</div>
		<button type="submit">추가</button>
	</form>
</body>
</html>
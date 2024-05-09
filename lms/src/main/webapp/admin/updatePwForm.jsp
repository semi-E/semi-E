<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
	<form method="post" action="/lms/admin/updatePwAction.jsp">
		<div>
			예전 비밀번호: <input type="text" name = "oldPw">
		</div>
		<div>
			새 비밀번호: <input type="text" name = "newPw">
		</div>
		<div>
			<button type="button">제출</button>
		</div>
	</form>
</body>
</html>
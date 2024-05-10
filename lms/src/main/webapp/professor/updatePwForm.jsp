<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<form method="post" action="/lms/professor/updatePwAction.jsp">
		비밀번호 : <input type="password" name="oldPw"><br>
		새 비밀번호 : <input type="password" name="newPw"><br>
		<button type="submit">변경</button>
	</form>
</body>
</html>
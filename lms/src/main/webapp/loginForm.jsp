<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
	<h1>로그인 폼</h1>
		<body>
			<form	method="post" action="/lms/loginAction.jsp">
				<div>
					<label for="id">아이디</label>
					<input type="text" id="id" maxlength="9" required="required" name="id" placeholder="abc1234@naver.com">
				</div>
				<div>
					<label for="pw">비밀번호</label>
					<input type="password" id="pw" maxlength="9" required="required" name="pw">
				</div>
			<button type="submit">로그인</button>
		</form>
	</body>
</html>
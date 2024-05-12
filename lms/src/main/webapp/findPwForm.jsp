<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 폼</title>
</head>
	<h1>비밀번호 찾기</h1>
	<body>
		<form method="post" action="/lms/findPwAction.jsp">
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" maxlength="9" required="required" name="id" placeholder="abc1234@naver.com">
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="email" id="pw" maxlength="25" required="required" name="email">
			</div>
			<button type="submit">로그인</button>			
		</form>
	</body>
</html>
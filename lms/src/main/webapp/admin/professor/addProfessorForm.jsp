<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교수 등록</h1>
	<form method="post" action="/lms/admin/professor/addProfessorAction.jsp">
		<!-- javascript로 최소 글자 9자로 지정할수있게 나중에 해야함, 첫글자는 무조건2, 6~7은 학과에 맞게 -->
		교수 번호<input type="text" name="professorNo"  maxlength="9" required><br>
		교수 이름<input type="text" name="name" required><br>
		<!--  학과 리스트를 받아와서 select로 변경할수도있음 -->
		학과<input type="text" name="department" required><br>
		<button type="submit">등록</button>
	</form>
</body>
</html>
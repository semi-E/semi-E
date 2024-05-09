<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<form method="post" action="/lms/admin/students/addStudentAction.jsp">
		<div>
			<label for="studentNo">studentNo</label>
			<input type="text"name="studentNo" id="studentNo">
		</div>
	
		<div>
			<label for="name">이름</label> 
			<input type="text" name="name" id="name">
		</div>
		
		<div>
			<label for="department">학과</label> 
			<input type="text"name="department" id="deprartment">
		</div>
		
		<div><button type="submit">학생추가</button></div>
	</form>







</body>
</html>
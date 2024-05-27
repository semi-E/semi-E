<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<jsp:include page="/admin/include/classListSidebar.jsp"></jsp:include>
		<h1>과목 추가하기</h1>
		<form method="post" action="/lms/admin/subjects/addSubjectAction.jsp">
			<div>
				<label for="subjectName">과목이름</label>
				<input type="text" required name="subjectName" id="subjectName">
			</div>
			<div>
				<label for="credit">학점</label>
				<input type="number" required name="credit" id="credit">
			</div>
			 <button type="submit">추가하기</button>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
            <jsp:include page="/admin/include/classListSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">과목 추가하기</h1>
							<form method="post" action="/lms/admin/subjects/addSubjectAction.jsp">
							<div>
								<label for="subjectName">과목이름</label>
								<input type="text" required name="subjectName" id="subjectName" class="form-control">
							</div>
							<div>
								<label for="credit">학점</label>
								<input type="number" required name="credit" id="credit" class="form-control">
							</div>
						 <button type="submit"  class="btn btn-primary mt-3">추가하기</button>
					</form>
					</div>
				</div>
			</div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
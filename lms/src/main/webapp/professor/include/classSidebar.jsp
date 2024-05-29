<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="theme-setting-wrapper">
		<div id="settings-trigger">
			<i class="ti-settings"></i>
		</div>
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link" data-toggle="collapse"
					href="#class" aria-expanded="false" aria-controls="class">
						<i class="icon-layout menu-icon"></i> <span class="menu-title">강의</span>
						<i class="menu-arrow"></i>
				</a>
					<div class="collapse" id="class">
						<ul class="nav flex-column sub-menu">
							<li class="nav-item"><a class="nav-link"
								href="/lms/professor/class/myClassList.jsp">내
									강의 목록</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/lms/professor/class/classOpenApplyList.jsp">강의
									개설 신청 목록</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/lms/professor/class/addClassOpenApplyForm.jsp">강의
									개설 신청</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/lms/professor/class/classList.jsp">강의
									목록</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/lms/professor/class/subjectList.jsp">과목
									목록</a></li>
						</ul>
					</div></li>

			</ul>
	</div>
	</li>
	</ul>
	</nav>
</body>
</html>
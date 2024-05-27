<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	String grade = (String)(sessionInfo.get("grade"));
	String name = (String)(sessionInfo.get("name"));
%>
<head>
	<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/lms/ccs/vendors/feather/feather.css">
  <link rel="stylesheet" href="/lms/css/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/lms/css/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="/lms/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="/lms/css/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="/lms/css/text/css" href="css/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/lms/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>    
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    	<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      		<a class="navbar-brand brand-logo mr-5" href="/lms/admin/main.jsp"><img src="/lms/upload/mm.svg" class="mr-2" alt="logo"/></a>
       	<a class="navbar-brand brand-logo-mini" href="index.html"><img src="/lms/upload/mm.svg" alt="logo"/></a>
     	</div>
     	<div class="navbar-menu-wrapper d-flex align-items-center">
     		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        	<li class="nav-item">
          		<a class="nav-link" href="/lms/admin/myPage.jsp" role="button">
            		마이페이지
          		</a>
        	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" href="/lms/admin/students/studentList.jsp" role="button" data-toggle="dropdown" aria-expanded="false">
            		인원 관리
          		</a>
          		<ul class="dropdown-menu" style="position:absolute;">
          			<%
          				if(grade.equals("마스터")){
          			%>
	            			<li><a class="dropdown-item" href="/lms/admin/admins/adminList.jsp">관리자 관리</a></li>
	            	<%
          				}
	            	%>
	            	<li><a class="dropdown-item" href="/lms/admin/students/studentList.jsp">학생 관리</a></li>
	            	<li><a class="dropdown-item" href="/lms/admin/professor/professorList.jsp">교수 관리</a></li>
	          	</ul>
          	</li>
        	<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle" href="/lms/subjects/classList.jsp" role="button" data-toggle="dropdown" aria-expanded="false">
            		강의 관리
          		</a>
          		<ul class="dropdown-menu" style="position:absolute;">
	            	<li><a class="dropdown-item" href="/lms/admin/department/departmentList.jsp">학과 관리</a></li>
	            	<li><a class="dropdown-item" href="/lms/admin/subjects/subjectList.jsp">과목 관리</a></li>
	            	<li><a class="dropdown-item" href="/lms/admin/subjects/classList.jsp">강의 관리</a></li>
	            	<li><a class="dropdown-item" href="/lms/admin/subjects/classOpenApplyList.jsp">강의 개설 신청 관리</a></li>
	          	</ul>
          	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="/lms/admin/notice/noticeList.jsp" role="button">
            		공지사항
          		</a>
          	</li>
     		</ul>
   		<ul class="navbar-nav navbar-nav-right">
          <li class="nav-item">
           		<b><%=name %></b>님
          </li>
          <li class="nav-item">
            <a class="nav-link" " href="/lms/logout.jsp" role="button">
            	로그아웃
            </a>
          </li>
        </ul>
   	</div>
</nav>

<!-- plugins:js -->
<script src="/lms/css/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/lms/css/vendors/chart.js/Chart.min.js"></script>
<script src="/lms/css/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="/lms/css/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/lms/css/js/dataTables.select.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/lms/css/js/off-canvas.js"></script>
<script src="/lms/css/js/hoverable-collapse.js"></script>
<script src="/lms/css/js/template.js"></script>
<script src="/lms/css/js/settings.js"></script>
<script src="/lms/css/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="/lms/css/js/dashboard.js"></script>
<script src="/lms/css/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->


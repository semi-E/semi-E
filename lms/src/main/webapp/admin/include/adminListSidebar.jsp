<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 	 <!-- partial:partials/_settings-panel.html -->
  <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<ul class="nav">
       		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">관리자 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="ui-basic">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/admins/adminList.jsp">관리 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href=/lms/admin/admins/addAdminForm.jsp>관리자추가</a></li>
             </ul>
           </div>
	 	</li>
       		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">학생 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="form-elements">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/students/studentList.jsp">학생 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href=/lms/admin/students/addStudentForm.jsp>학생 추가</a></li>
             </ul>
           </div>
	 	</li>
	 	<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">교수 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="charts">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/professor/professorList.jsp">교수 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/professor/addProfessorForm.jsp">교수 추가</a></li>
             </ul>
           </div>
	 	</li>
	 	</ul>
   </nav>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 	 <!-- partial:partials/_settings-panel.html -->
 	 <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        	<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<ul class="nav">
       		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">학과 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="ui-basic">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/department/departmentList.jsp">학과 리스트</a></li>
             </ul>
           </div>
	 	</li>
       		<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">과목 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="form-elements">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/subjects/subjectList.jsp">과목 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href=/lms/admin/subjects/addSubjectForm.jsp>과목 추가</a></li>
             </ul>
           </div>
	 	</li>
	 	<li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="ui-basic">
              	<i class="icon-layout menu-icon"></i>
              	<span class="menu-title">강의 관리</span>
   			 <i class="menu-arrow"></i>
            </a>
           <div class="collapse" id="charts">
             <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/subjects/classList.jsp">개설 승인 강의 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/subjects/classOpenApplyList.jsp">개설 신청 강의 리스트</a></li>
             </ul>
           </div>
	 	</li>
 	</ul>
   </nav>
</div>
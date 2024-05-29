<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item">
              <a
                class="nav-link"
                data-toggle="collapse"
                href="#myPage"
                aria-expanded="false"
                aria-controls="myPage"
              >
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">마이페이지</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="myPage">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/myPage.jsp"
                      >내 정보</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/updateMyPageForm.jsp"
                      >정보 수정</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/updatePwForm.jsp"
                      >비밀번호 변경</a
                    >
                  </li>
                  
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a
                class="nav-link"
                data-toggle="collapse"
                href="#grade"
                aria-expanded="false"
                aria-controls="grade"
              >
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">성적</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="grade">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/grade/gradeList.jsp"
                      >학기 별 성적</a
                    >
            	</li>
         	 </ul>
         	 </div>
        	 </ul>
        </nav>
</div>
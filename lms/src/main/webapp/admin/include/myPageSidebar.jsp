<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 	 <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        	<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">관리자 페이지</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/myPage.jsp ">내 정보</a></li>
                <li class="nav-item"><a class="nav-link" href="/lms/admin/updatePwForm.jsp">비밀번호 변경</a></li>
                <li class="nav-item"><a class="nav-link" href="/lms/admin/updateMyPageForm.jsp">내 정보 변경</a></li>
              </ul>
            </div>
          </li>
         </ul>
      </nav>
      </div>
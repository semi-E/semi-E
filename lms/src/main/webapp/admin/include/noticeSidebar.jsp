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
              <span class="menu-title">공지 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/notice/noticeList.jsp">공지리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="/lms/admin/notice/addNoticeForm.jsp">공지 추가</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      </div>
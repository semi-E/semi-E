<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
	<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item">
              <a
                class="nav-link"
                data-toggle="collapse"
                href="#class"
                aria-expanded="false"
                aria-controls="class"
              >
                <i class="icon-layout menu-icon"></i>
                <span class="menu-title">강의</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/class/myClassList.jsp"
                      >내 강의 목록</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/class/schedule.jsp"
                      >시간표</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/class/classList.jsp"
                      >강의 목록</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/class/subjectList.jsp"
                      >과목 목록</a
                    >
                  </li>
                </ul>
              </div>
            </li>

          </ul>
        </nav>
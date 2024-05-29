<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
                <span class="menu-title">강의 게시판</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="myPage">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/classBoard/myClassBoardList.jsp"
                      >강의 리스트</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/classBoard/attendanceList.jsp?classApplyNo=<%=request.getParameter("classApplyNo") %>"
                      >출결</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/lms/student/classBoard/myClassAssignmentList.jsp?classApplyNo=<%=request.getParameter("classApplyNo") %>"
                      >과제</a
                    >
                  </li>
                  
                </ul>
              </div>
            </li>
           </ul>
        </nav>
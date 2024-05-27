<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>   
<%@page import="lms.dao.*"%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	int currentPage = 0;
	if(request.getParameter("currentPage") == null){
		currentPage = 1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	String title = request.getParameter("title");
	//디버깅
	System.out.println(title + "<-- noticeList title");

	// title을 검색하지 않았을 경우
	if(title == null){
		title = "";
	}
	
	// 검색된 notice의 개수
	int cnt = NoticeDAO.selectNoticeCount(title);
	int lastPage = 0;
	
	int rowperPage = 10;
	int startRow = (currentPage - 1) * rowperPage;
	
	
	if(cnt % rowperPage == 0){
		lastPage = cnt / rowperPage;
	} else {
		lastPage = cnt / rowperPage + 1;
	}
	
	// 공지 호출
	ArrayList<HashMap<String, Object>> selectNoticeList = NoticeDAO.selectNoticeList(title , startRow, rowperPage);
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginProfessor"));
	int professorNo = (Integer)(sessionInfo.get("professorNo"));
	
	ArrayList<HashMap<String, Object>> list = ClassOpenApplyDAO.selectMyClassOpenApplyList(professorNo, "승인");
	
	
%>
	

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
	   table.table-bordered {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	table.table-bordered th,
	table.table-bordered td {
	    border: 1px solid black;
	    padding: 8px;
	    text-align: center;
	}
	
	table.table-bordered th {
	    background-color: #f2f2f2;
	}
	
	table.table-bordered .python {
	    background-color: #6dbb1a; 
	    color: white;
	}
	
	table.table-bordered .java {
	    background-color: #007bff; 
	    color: white;
	}
	
	table.table-bordered .architecture {
	    background-color: #dc3545; 
	    color: white;
	}
</style>


</head>
<body>
	
	<div class="container-scroller">
		<jsp:include page="/professor/include/header.jsp"></jsp:include>
		<h1>Main</h1>	
		 <div>
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold">Welcome professor!</h3>
                  <h6 class="font-weight-normal mb-0">All systems are running smoothly! You have <span class="text-primary">3 unread alerts!</span></h6>
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                  <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                    <button class="btn btn-sm btn-light bg-white dropdown-toggle" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                     <i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
                      <a class="dropdown-item" href="#">January - March</a>
                      <a class="dropdown-item" href="#">March - June</a>
                      <a class="dropdown-item" href="#">June - August</a>
                      <a class="dropdown-item" href="#">August - November</a>
                    </div>
                  </div>
                 </div>
                </div>
              </div>
            </div>
          </div>
        
              <div class="card tale-bg">           
                  <img src="/lms/upload/gggg.PNG" alt="dd">
                  <div class="weather-info">
                    <div class="d-flex">
                      <div>
                        <h2>2024.05.23.(목)</h2>
                      </div>
                      <div class="ml-2">
                        <h4 class="location font-weight-normal">서울</h4>
                        <h6 class="font-weight-normal">한국</h6>
                      </div>
                    </div>	
                  </div>                   
            </div>
               
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card position-relative">
                <div class="card-body">
                  <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <div class="row">
                    <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
           <div class="row">
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title mb-0">공지사항</p>
                  <div class="table-responsive">
                    <table class="table table-striped table-borderless">
                      <thead>
						<tr>
							<th>공지번호</th>
							<th>제목</th>
						</tr>
						</thead>
	                   <tbody>
       		<%
				for(HashMap m : selectNoticeList){
			%>
				<tr>
					<td><a href="/lms/professor/notice/noticeOne.jsp?noticeNo=<%=m.get("noticeNo") %>"><%=m.get("noticeNo") %></a></td>
					<td><a href="/lms/professor/notice/noticeOne.jsp?noticeNo=<%=m.get("noticeNo") %>"><%=m.get("title") %></a></td>
				</tr>
			<%
				}
			%>

                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">시간표</h4>
									<div class="list-wrapper pt-2">
										<div class="container-scroller">
		<h1>강의 시간표</h1>
		<table  class="table table-bordered">
		    <tr>
							<th>강의 번호</th>
							<th>강의명</th>
							<th>강의실</th>
							<th>과목 명</th>
							<th>요일</th>
							<th>시작 교시</th>
							<th>년도</th>
							<th>학기</th>
							<th>학점</th>
						</tr>
		    
		   	  <%
				for(HashMap m : list){
			%>
					<tr>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("className") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classroom") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("subjectName") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("days") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("periodStart") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("year") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("semester") %></a></td>
						<td><a href="/lms/professor/classBoard/myClassBoardOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("credit") %></a></td>
					</tr>
			<%
				}
			%>
  
       </table>
	</div>
                  </div>
                  <div class="add-items d-flex mb-0 mt-2">
										<input type="text" class="form-control todo-list-input"  placeholder="memo">
										<button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent"><i class="icon-circle-plus"></i></button>
									</div>
								</div>
							</div>
            </div>
          </div>
        </div>
		
	</div>
	
	</div>
	</div>
	</div>
	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.NoticeDAO"%>      
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>  
<%@page import="lms.dao.MyclassDAO"%>     
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
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
	
	
	
	ArrayList<HashMap<String, Object>> list = NoticeDAO.selectNoticeList(title, startRow, rowperPage);
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	System.out.println(studentNo+"<-----studentNo");
%>
	
<%
	ArrayList<HashMap<String, Object>> list1 = MyclassDAO.selectMyClasslist(studentNo);
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
		<jsp:include page="/student/include/header.jsp"></jsp:include>
		<h1>Main</h1>	
		 <div>
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold">Welcome student!</h3>
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
                  <img src="/lms/upload/www.png" alt="dd">
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
			<td>공지번호</td>
			<td>제목</td>
		</tr>
                      </thead>
                      <tbody>
                      
	<%
		for(HashMap<String, Object> m : list){
	%>
		<tr>
			<td><%=m.get("noticeNo") %></td>
			<td><a href="/lms/student/notice/noticeOne.jsp?noticeNo=<%=m.get("noticeNo") %>"><%=m.get("title") %></a></td>
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
		        <th></th>
		        <th>월</th>
		        <th>화</th>
		        <th>수</th>
		        <th>목</th>
		        <th>금</th>
		    </tr>
		    
		   	<%
		    	String[] daysArray = {"월", "화", "수", "목", "금"};
		    
		    	for (int period = 1; period <= 8; period++) {//시작교시 비교
		    		 String time = "";
		    		    if (period == 1) {
		    		        time = "(9:00~10:00)";
		    		    } else if (period == 2) {
		    		        time = "(10:00~11:00)";
		    		    } else if (period == 3) {
		    		        time = "(11:00~12:00)";
		    		    } else if (period == 4) {
		    		        time = "(12:00~13:00)";
		    		    } else if (period == 5) {
		    		        time = "(13:00~14:00)";
		    		    } else if (period == 6) {
		    		        time = "(14:00~15:00)";
		    		    } else if (period == 7) {
		    		        time = "(15:00~16:00)";
		    		    } else if (period == 8) {
		    		        time = "(16:00~17:00)";
		    		    } else {
		    		        time = ""; 
		    		    }	 		
			%>
		    <tr>
		        	<th><%= period %>교시<%= time %></th>
		        <% 
		            for (String day : daysArray)  { 
		        %>
		        <%
		            // 각 수업에 대한 색상 클래스를 먼저 정의
		            // 공백으로 비워놔야 아래에 학생 자신의 강의 리스트를 가져오는 부분에서 if분기문으로 알맞게 색이 들어감.
		            String classColor = "";
		        	
		        %>
		        <%
		            for (HashMap<String,Object> m : list1) {// 시작교시, 요일 비교 
		                if (day.equals((String)(m.get("days")))) {
		                    if (period >= (Integer)(m.get("periodStart")) && period < (Integer)(m.get("periodStart"))+(Integer)m.get("credit")) {
		                        String className = (String) m.get("className");
		                        // 수업 이름에 따라 적절한 색상 클래스를 지정
		                        if (className.equals("자바의 기초")) {
		                            classColor = "java";
		                        } else if (className.equals("파이썬의 기초")) {
		                            classColor = "python";
		                        } else if (className.equals("건축학의 기초")) {
		                            classColor = "architecture";
		                        }
		        %>
		                        <td class="<%= classColor %>"><%= m.get("className") %></td>
		        <%
		                    } else {
		        %>
		                        <td></td>
		        <%
		                    }
		                }
		            }
		        %>
		        <% 
		        	}
		        %>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="lms.dao.MyclassDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>    


<%
    //세션인증분기 - loginProfessor 학생
    if(session.getAttribute("loginStudent") == null) {
        response.sendRedirect("/lms/loginForm.jsp");
        return;
    }
%>   

<%
    HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
    int studentNo = (Integer)(sessionInfo.get("studentNo"));
    ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 강의 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container-scroller {
            display: flex;
        }
        .sidebar {
            width: 250px;
            flex-shrink: 0;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
        }
        .table-responsive {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">내 강의 목록</h1>
                		 <table class="table table-striped table-borderless">
                            <thead>
                                <tr>
                                    <th>강의 번호</th>
                                    <th>강의 이름</th>
                                    <th>교수 번호</th>
                                    <th>과목 이름</th>
                                    <th>요일</th>
                                    <th>시작 교시</th>
                                    <th>학점</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for(HashMap<String,Object> m : list) {
                                %>
                                    <tr>
                                        <td><a href="/lms/student/class/myClassOne.jsp?classApplyNo=<%=m.get("classApplyNo") %>"><%=m.get("classApplyNo") %></a></td>
                                        <td><%=m.get("className") %></td>
                                        <td><%=m.get("professorNo") %></td>
                                        <td><%=m.get("subjectName") %></td>
                                        <td><%=m.get("days") %></td>
                                        <td><%=m.get("periodStart") %></td>
                                        <td><%=m.get("credit") %></td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
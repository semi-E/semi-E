<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>
<%@ page import="lms.dao.*"%>

<%
    // 세션인증분기 - loginProfessor 학생
    if(session.getAttribute("loginStudent") == null) {
        response.sendRedirect("/lms/loginForm.jsp");
        return;
    }
%>
<%
    HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
    int studentNo = (Integer)(sessionInfo.get("studentNo"));
    HashMap<String, Object> m = StudentDAO.selectStudent(studentNo);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
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
    </style>
</head>
<body>
    <div class="container-scroller">
        <jsp:include page="/student/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/student/include/myPageSidebar.jsp"></jsp:include>
            <div class="main-content">
                <h1 class="mb-4">My Page</h1>
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>번호</th>
                        <td><%=m.get("studentNo") %></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><%= m.get("name")%></td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><%= m.get("gender")%></td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td><%= m.get("birthday")%></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><%= m.get("phone")%></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td><%= m.get("address")%></td>
                    </tr>
                    <tr>
                        <th>재학상태</th>
                        <td><%= m.get("state")%></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><%= m.get("email")%></td>
                    </tr>
                    <tr>
                        <th>학과</th>
                        <td><%=m.get("department") %></td>
                    </tr>
                </table>
                <a href="/lms/student/updateMyPageForm.jsp" class="btn btn-primary">수정</a>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "lms.dao.*" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));

	System.out.println(studentNo+"<------studentNo");
	
	HashMap<String, Object> m = StudentDAO.selectStudent(studentNo);
	
	ArrayList<HashMap<String, Object>> List = DepartmentDAO.selectDepartmentList();

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <jsp:include page="/admin/include/header.jsp"></jsp:include>
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="/admin/include/adminListSidebar.jsp"></jsp:include>
        <div class="main-panel">
            <div class="content-wrapper">
                <h1>학생 정보 상세보기</h1>

                <form method="post" action="/lms/admin/students/updateStudentAction.jsp">
                    <table border="1">
                        <tr>
                            <th>번호</th>
                            <td><input type="hidden" name="studentNo" value="<%=m.get("studentNo") %>"><%=m.get("studentNo") %></td>
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
                            <th>전화번호</th>
                            <td><%= m.get("phone")%></td>
                        </tr>

                        <tr>
                            <th>주소</th>
                            <td><%= m.get("address")%></td>
                        </tr>

                        <tr>
                            <th>재학상태</th>
                            <td>
                                <select name="state">
                                    <%
								if(m.get("state").equals("재학")){
							%>
                                    <option value="재학" selected>재학</option>
                                    <option value="휴학">휴학</option>
                                    <option value="퇴학">퇴학</option>
                                    <%
						    	} else if(m.get("state").equals("재학")){
						    %>
                                    <option value="재학">재학</option>
                                    <option value="휴학" selected>휴학</option>
                                    <option value="퇴학">퇴학</option>
                                    <%
						    	} else if (m.get("state").equals("재학")) {
						    %>
                                    <option value="재학">재학</option>
                                    <option value="휴학">휴학</option>
                                    <option value="퇴학" selected>퇴학</option>
                                    <%
	    						} else {
							%>
                                    <option value="재학">재학</option>
                                    <option value="휴학">휴학</option>
                                    <option value="퇴학">퇴학</option>
                                    <option value="자퇴" selected>자퇴</option>

                                    <%
						    	}
						    %>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>이메일</th>
                            <td><%= m.get("email")%></td>
                        </tr>

                        <tr>
                            <th>학과</th>
                            <td><select name="department">
                                    <%
					for(HashMap m1 : List){
				%>
                                    <option value=<%=m1.get("department") %>><%=m1.get("department") %></option>
                                    <%
					}
				%>
                                </select></td>
                        </tr>

                    </table>

                    <button type="submit">수정</button>

                </form>
            </div>
        </div>
    </div>

</body>

</html>
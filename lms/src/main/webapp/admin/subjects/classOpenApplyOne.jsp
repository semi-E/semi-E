<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="lms.dao.ClassOpenApplyDAO"%>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	int professorNo = Integer.parseInt(request.getParameter("professorNo"));

	System.out.println(classApplyNo + "<--classApplyNo");
	System.out.println(professorNo + "<--professorNo");
	
	HashMap<String, Object> m = ClassOpenApplyDAO.selecMyClassOpenApply(classApplyNo, professorNo);
	
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>classOpenApplyOne</title>
</head>

<body>
    <jsp:include page="/admin/include/header.jsp"></jsp:include>
    <div class="container-fluid page-body-wrapper">
        <jsp:include page="/admin/include/classListSidebar.jsp"></jsp:include>
        <div class="main-panel">
            <div class="content-wrapper">
                <h1>강의신청목록 상세보기</h1>
                <form action="/lms/admin/subjects/updateClassOpenApplyAction.jsp" method="post">
                    <input type="hidden" name="classApplyNo" value="<%=classApplyNo%>">
                    <table border="1">
                        <tr>
                            <th>과목이름</th>
                            <td>
                                <%=m.get("subjectName") %>
                            </td>
                        </tr>
                        <tr>
                            <th>수업이름</th>
                            <td>
                                <%=m.get("className") %>
                            </td>
                        </tr>
                        <tr>
                            <th>시작 교시</th>
                            <td>
                                <%=m.get("periodStart") %>
                            </td>
                        </tr>
                        <tr>
                            <th>요일</th>
                            <td>
                                <%=m.get("days") %>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일시</th>
                            <td>
                                <%=m.get("createDate") %>
                            </td>
                        </tr>
                        <tr>
                            <th>허용상태</th>
                            <td>
                                <select name="state">
                                    <option value="승인대기">승인대기</option>
                                    <option value="승인">승인</option>
                                    <option value="승인거절">승인거절</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>강의실</th>
                            <td>
                                <input type="text" name="classRoom">
                            </td>
                        </tr>
                    </table>
                    <button type="submit">수정하기</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
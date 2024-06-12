<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.HashMap"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
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
	//파라미터
	String subjectName = request.getParameter("subjectName");
	
	//디버깅
	System.out.println(currentPage + "<-- subjectList currentPage");
	System.out.println(subjectName + "<-- subjectList subjectName");
	//검색에 의해서 null값이 넘어오기때문에 예외처리를 해줘야함 
	if(subjectName == null){
		subjectName = "";
	}
	
	
	int cnt = SubjectDAO.selectSubjectCount(subjectName);
	int lastPage = 0;
	
	int rowPerPage = 10;
	int startRow = (currentPage - 1) * rowPerPage;
	
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	
	//DAO 호출
	ArrayList<HashMap<String, Object>> selectSubjectList= SubjectDAO.selectSubjectList(subjectName, startRow, rowPerPage);
 %>

 <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>	
<body>
    <div class="container-scroller">
        <jsp:include page="/admin/include/header.jsp"></jsp:include>
        <div class="container-fluid page-body-wrapper">
            <jsp:include page="/admin/include/classListSidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <h1 class="mb-4">과목 리스트</h1>
                <form action="/lms/admin/subjects/subjectList.jsp">
                    <div><input type="text" name="subjectName"> <button type="submit" class="btn btn-primary mt-3">검색</button></div>
                   
                </form>
                <table border="1" class="table table-bordered">
                    <%
						for(HashMap m : selectSubjectList){
					%>
                    <tr>
                        <td><%=(String)(m.get("subjectName"))%></td> <!-- 과목 -->
                        <td><%=(Integer)(m.get("adminNo"))%></td> <!-- 관리자번호 -->
                        <td><%=(Integer)(m.get("credit"))%></td> <!-- 학점 -->
                        <td><a href="/lms/admin/subjects/deleteSubjectAction.jsp?subjectName=<%=(String)(m.get("subjectName"))%>">삭제</a></td>
                    </tr>
                    <%
						}
					%>
                </table>
                <a href="/lms/admin/subjects/addSubjectForm.jsp">과목 추가하기</a>

                <%
				if(currentPage > 1){
			%>
                <a href="/lms/admin/subjects/subjectList.jsp?currentPage=1&subjectName=<%=subjectName%>">처음</a>
                <a href="/lms/admin/subjects/subjectList.jsp?currentPage=<%=currentPage - 1 %>&subjectName=<%=subjectName%>">이전</a>
                <%
				}
			%>

                <%
				if(currentPage < lastPage){
			%>
                <a href="/lms/admin/subjects/subjectList.jsp?currentPage=<%=currentPage + 1 %>&subjectName=<%=subjectName%>">다음</a>
                <a href="/lms/admin/subjects/subjectList.jsp?currentPage=<%=lastPage%>&subjectName=<%=subjectName%>">마지막</a>
                <%
				}
			%>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
</body>
</html>
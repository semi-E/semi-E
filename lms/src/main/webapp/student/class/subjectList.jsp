<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.SubjectDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%> 
<%
	// 세션인증분기 - loginAdmin 관리자
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
	
	String subjectName =request.getParameter("subjectName");

	System.out.println(subjectName+"<-----subjectName");

	// subjectName이 null 값으로 들어오기 때문에 공백으로 빼줘야함.
	if(subjectName == null){
		subjectName = "";
	}
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;
	
	int cnt = SubjectDAO.selectSubjectCount(subjectName);
	int lastPage = 0;
	
	if(cnt % rowPerPage == 0){
		lastPage = cnt / rowPerPage;
	} else {
		lastPage = cnt / rowPerPage + 1;
	}
	

	ArrayList<HashMap<String, Object>> subjectList = SubjectDAO.selectSubjectList(subjectName, startRow, rowPerPage);
 %>   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 리스트</h1>
	
	<form method="get" action="/lms/student/class/subjectList.jsp">
		과목이름:<input type="text" name = "subjectName">
		학점:<input type="text" name = "credit">
	
		<button type="submit">검색</button>
		
	</form>
	
	
	
	
	<table border = "1">
	
		<tr>
			<td>과목이름</td>
			<td>학점</td>		
		</tr>	
				
        <%
            for(HashMap<String, Object> m : subjectList){
        %>
        
	        <tr>
	            <td><%= m.get("subjectName") %></td>
	            <td><%= m.get("credit") %></td>
	        </tr>
        	
        <%
            }
        %>
	
	</table>


	
</body>
</html>
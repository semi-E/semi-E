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

	
	
	int rowPerPage = 10;
	int startRow = (currentPage-1)*rowPerPage;

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
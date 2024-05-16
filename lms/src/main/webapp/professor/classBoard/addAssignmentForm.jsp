<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.AssignmentDAO"%>    

<%

	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}

	

	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	System.out.println(classApplyNo+"<------classApplyNo");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>	
<body>
	<h1>과제 추가</h1>
	
		<form method="post"action="/lms/professor/classBoard/addAssignmentAction.jsp " >
		
		<table>
		<tr>
	    <td><input type="hidden" id="classApplyNo" name="classApplyNo" value="<%=classApplyNo%>"></td>
		</tr>
		
		<tr>
	 	<td><label for="title">제목:</label></td>
	    <td><input type="text" id="title" name="title" required></td>
	    </tr>
	    
	    <tr>
	   	<td> <label for="content">내용:</label></td>
	   	<td> <textarea id="content" name="content" rows="4" cols="50" required></textarea></td>
	     </tr>
	     <tr>
	    <td><label for="endDate">종료일:</label></td>
	    <td><input type="date" id="endDate" name="endDate" required></td>
	 
	     </tr>
	    
	       </table>
	   <button type ="submit">과제 추가</button>
</form>

</body>
</html>
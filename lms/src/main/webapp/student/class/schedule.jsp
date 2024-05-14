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
	
	System.out.println(studentNo+"<-----studentNo");
%>
	
<%
	ArrayList<HashMap<String, Object>> list = MyclassDAO.selectMyClasslist(studentNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="caption">나의 시간표</div>
<table border="1">
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
	%>
		    <tr>
		        <th><%= period %></th>
            
        <% 
        	for (String day : daysArray)  { 
        %>
        <%
            	for(HashMap<String,Object> m : list) {// 시작교시, 요일 비교 
            		if(day.equals((String)(m.get("days")))){
            			System.out.println("가나다람");
            			if(period >= (Integer)(m.get("periodStart")) && period < (Integer)(m.get("periodStart"))+(Integer)m.get("credit") ){
            		
		%>
					
        					<td><%=m.get("className") %></td>
		<%
            			} else {
		%>
							<td></td>
		<%
            			}
		%>
				
   	     		
        <%   		
            		}
           		}
        	}
        %>
        
        </tr>
 	<% 
     	}
	%>
   
        
        
        
       
</table>
</body>
</html>
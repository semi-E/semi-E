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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


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
    		        time = "(13:00~14:00)";
    		    } else if (period == 5) {
    		        time = "(14:00~15:00)";
    		    } else if (period == 6) {
    		        time = "(15:00~16:00)";
    		    } else if (period == 7) {
    		        time = "(16:00~17:00)";
    		    } else if (period == 8) {
    		        time = "(17:00~18:00)";
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
            for (HashMap<String,Object> m : list) {// 시작교시, 요일 비교 
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
</body>
</html>
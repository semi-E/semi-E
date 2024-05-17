<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.StudentAssignmentDAO"%>   
<%@page import="java.util.HashMap"%>       
    
 <%
 	System.out.println("abcd");
 	String state = request.getParameter("state");
 	
 	System.out.println(state+"<----state");
 
 	int assignmentNo = Integer.parseInt((request.getParameter("assignmentNo")));
		
	System.out.println(assignmentNo+"<----submitAssignmentOne.assignmentNo");
	
	int studentNo = Integer.parseInt((request.getParameter("studentNo")));
	
	System.out.println(studentNo+"<----submitAssignmentOne.studentNo");
	
	int row = StudentAssignmentDAO.updatesubmitAssignment(assignmentNo, state, studentNo);
	
	System.out.println("xxxxx");
	
	String errormsg ="잘못된 변경 값입니다";	
	
	if(row == 1){
		System.out.println("제출과제 수정 성공");
		response.sendRedirect("/lms/professor/classBoard/submitAssignmentOne.jsp?assignmentNo=" + assignmentNo + "&studentNo=" + studentNo);
	}else {
		System.out.println("제출과제 수정 실패");
		response.sendRedirect("/lms/professor/classBoard/submitAssignmentOne.jsp?assignmentNo=" + assignmentNo + "&studentNo=" + studentNo +  "&error=" + errormsg);
	}
 %>  
    
</body>
</html>
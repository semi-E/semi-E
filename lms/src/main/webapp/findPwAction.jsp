<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/admin/main.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/student/main.jsp");
		return;
	}
%>
<%
	//세션인증분기 - loginProfessor 교수 
	if(session.getAttribute("loginProfessor") != null) { //이미 로그인을 한 상태라면
		response.sendRedirect("/lms/professor/main.jsp");
		return;
	}
%>
<%
	//파라미터
	int id = Integer.parseInt(request.getParameter("id"));
	String email =  request.getParameter("email");
	
	// 파라미터 디버깅
	System.out.println(id + "findPwAction.jsp + id ");
	System.out.println(email + "findAction.jsp + email");
%>

<%


	

/* -- 수정중
	AdminPwHistoryDAO.selectPw(id,email);
	StudentPwHistoryDAO.selectPw(id,email);
	professor_Pw_HistoryDAO.selectPw(id,email);
	
	if(row==1){}

*/
%>
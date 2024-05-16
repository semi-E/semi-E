<%@page import="lms.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
//현재 페이지 시스템 알림
System.out.println("페이지: deleteAdminAction.jsp");

int studentNo = Integer.valueOf(request.getParameter("studentNo"));  
int classApplyNo = Integer.valueOf(request.getParameter("classApplyNo"));  

int row = MyclassDAO.deleteMyClass(studentNo, classApplyNo);



//디버깅
System.out.println(studentNo + " <-- deleteMyClassAction studentNo");
System.out.println(classApplyNo + " <-- deleteMyClassAction deleteAdmin");



if(row == 1){ // 성공 했을 때
	
	System.out.println("나의 수강신청 삭제 성공");
	response.sendRedirect("/lms/student/classApply/myClassList.jsp");

} else { // 실패 했을 때
	
	System.out.println("나의 수강신청 삭제 실패");
	response.sendRedirect("/lms/student/classApply/myClassList.jsp");
}

%>
%>    
    
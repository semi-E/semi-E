<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="lms.dao.*"%>
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
	String userId = String.valueOf(id); 
	String email =  request.getParameter("email");
	
	// 파라미터 디버깅
	System.out.println(id + "findPwAction.jsp + id ");
	System.out.println(userId + "<--findAction.jsp Param userId");
	System.out.println(email + "findAction.jsp + email");
%>

<%
	if (userId.charAt(0) == '2') {
		if (userId.length() == 9) {
			System.out.println(id + ": 교수입니다.");
			//교수 비밀번호 찾기 
			HashMap<String,Object>professorSelectPw = AdminPwHistoryDAO.selectPw(id, email);
			if (professorSelectPw == null) {
				System.out.println("비밀번호 찾기 실패");
				response.sendRedirect("/lms/findPwForm.jsp");
			} else {
				System.out.println("비밀번호 찾기 성공");
				System.out.println();
			}
			//학생 비밀번호찾기(2로 시작하는 8자리)
		} else if (userId.length() == 8) {
			System.out.println(id + ": 학생입니다.");
			HashMap<String,Object>StudentSelectPw = AdminPwHistoryDAO.selectPw(id, email);
			if (StudentSelectPw == null) {
				System.out.println("비밀번호 찾기 실패");
				response.sendRedirect("/lms/findPwForm.jsp");
			}else {
			System.out.println("비밀번호 찾기 성공" );
			System.out.println();
			}
		}
	} else if (userId.charAt(0) == '1' && userId.length() == 9) {
		System.out.println(id + ": 관리자입니다.");
		HashMap<String,Object>AdminSelectPw = AdminPwHistoryDAO.selectPw(id, email);
		if (AdminSelectPw == null) {
			System.out.println("비밀번호 찾기 실패");
			response.sendRedirect("/lms/findPwForm.jsp");
		} else {
			System.out.println("비밀번호 찾기 성공");
			System.out.println();
		}
	}else {
		response.sendRedirect("/lms/findPwFormjsp");
	}
%>
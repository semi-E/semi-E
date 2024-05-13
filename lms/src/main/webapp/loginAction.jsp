<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="lms.dao.*" %>
<%@ page import="java.util.*" %>

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
	//각 번호의 자릿수로 식별을 위한 조건문에서 id를 문자열로 바꾸기 위해서 문자열을 담을 변수를 생성함
    String userId = String.valueOf(id); 
    String pw = request.getParameter("pw");

    // 파라미터 디버깅
    System.out.println(id + "<--loginAction.jsp Param id");
    System.out.println(userId + "<--loginAction.jsp Param userId");
    System.out.println(pw + "<--loginAction.jsp Param pw");
    %>
    <%

   	//관리자,교수,학생에 따라서 해당 메인페이지로 이동
	//교수 로그인 분기
	//2로 시작하는 9자리
	if (userId.charAt(0) == '2') {
		if (userId.length() == 9) {
	System.out.println(id + ": 교수입니다.");
	// 교수 로그인 DAO
	HashMap<String, Object> loginProfessor = ProfessorDAO.selectProfessor(id, pw);
	if (loginProfessor == null) {
		// 교수 로그인 실패
		System.out.println("로그인 실패");
		String errMsg = URLEncoder.encode("Check your ID & PW", "UTF-8");
		response.sendRedirect("/lms/loginForm.jsp?errMsg=" + errMsg);
		return;
		} else {
		// 로그인 성공
		System.out.println("교수 로그인 성공");
		session.setAttribute("loginProfessor", loginProfessor);
		response.sendRedirect("/lms/professor/main.jsp");
		return;
	}
	//학생 로그인분기
	//2로 시작하는 8자리
		} else if (userId.length() == 8) {
	System.out.println(id + ": 학생입니다.");
	// 학생 로그인 DAO
	HashMap<String, Object> loginStudent = StudentDAO.selectStudent(id, pw);
	if (loginStudent == null) {
		// 학생 로그인 실패
		System.out.println("로그인 실패");
		String errMsg = URLEncoder.encode("Check your ID & PW", "UTF-8");
		response.sendRedirect("/lms/loginForm.jsp?errMsg=" + errMsg);
		return;
	} else {
		// 로그인 성공
		System.out.println("학생 로그인 성공");
		session.setAttribute("loginStudent", loginStudent);
		response.sendRedirect("/lms/student/main.jsp");
		return;
		}
	}
	//관리자 로그인 분기
	//1로 시작하는 9자리
	}else if (userId.charAt(0) == '1' && userId.length() == 9) {
		System.out.println(id + ": 관리자입니다.");
		// 관리자 로그인 DAO
		HashMap<String, Object> loginAdmin = AdminDAO.selectAdmin(id, pw);
		if (loginAdmin == null) {
	// 관리자 로그인 실패
	System.out.println("로그인 실패");
	String errMsg = URLEncoder.encode("Check your ID & PW", "UTF-8");
	response.sendRedirect("/lms/loginForm.jsp?errMsg=" + errMsg);
	return;
		} else {
	// 로그인 성공 
	System.out.println("관리자 로그인 성공");
	session.setAttribute("loginAdmin", loginAdmin);
	response.sendRedirect("/lms/admin/main.jsp");
	return;
		}
	}else{
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="lms.dao.*" %>
<%@ page import="java.util.*" %>

<%
	//관리자 로그인 인증분기 - loginAdmin
    if (session.getAttribute("loginAdmin") != null) {
        // 이미 로그인을 한 상태라면
        response.sendRedirect("/lms/admin/main.jsp");
        return;
    }
%>
<%
	//학생 로그인 인증분기 - loginStudent
    if (session.getAttribute("loginStudent") != null) {
        // 이미 로그인을 한 상태라면
        response.sendRedirect("/lms/Student/main.jsp");
        return;
    }
%>
<%
    // 교수 로그인 인증분기 - loginProfessor
    if (session.getAttribute("loginProfessor") != null) {
        // 이미 로그인을 한 상태라면
        response.sendRedirect("/lms/Professor/main.jsp");
        return;
    }
%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String pw = request.getParameter("pw");

    // param 디버깅
    System.out.println(id + "<--loginAction.jsp Param id");
    System.out.println(pw + "<--loginAction.jsp Param pw");

    // 관리자 로그인 DAO
    HashMap<String, Object> loginAdmin = AdminDAO.loginAdmin(id, pw);
    // 학생 로그인 DAO
    HashMap<String, Object> loginStudent = StudentDAO.loginStudent(id, pw);
    // 교수 로그인 DAO
    HashMap<String, Object> loginProfessor = ProfessorDAO.loginProfessor(id, pw);

    // 로그인 성공시
    if (loginAdmin != null) {
        // 관리자 로그인 성공
        System.out.println("관리자 로그인 성공");
        session.setAttribute("loginAdmin", loginAdmin);
        response.sendRedirect("/lms/admin/main.jsp");
    } else if (loginStudent != null) {
        // 학생 로그인 성공
        System.out.println("학생 로그인 성공");
        session.setAttribute("loginStudent", loginStudent);
        response.sendRedirect("/lms/student/main.jsp");
    } else if (loginProfessor != null) {
        // 교수 로그인 성공
        System.out.println("교수 로그인 성공");
        session.setAttribute("loginProfessor", loginProfessor);
        response.sendRedirect("/lms/professor/main.jsp");
    } else {
        // 로그인 실패
        System.out.println("로그인 실패");
        String errMsg = URLEncoder.encode("Check your ID & PW", "UTF-8");
        response.sendRedirect("/lms/loginForm.jsp?errMsg=" + errMsg);
    }
%>

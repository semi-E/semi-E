<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%> 
<%@ page import="lms.dao.*" %>

<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginAdmin"));
	int adminNo = (Integer)(sessionInfo.get("adminNo"));
%>

<%
	//페이지 진입했는지 확인
	System.out.println("updatePwAction진입");

	String newPw = request.getParameter("newPw");
	System.out.println(newPw + " <-- updatePwAction newPw");

	String oldPw = request.getParameter("oldPw");
	System.out.println(oldPw + " <-- updatePwAction oldPw");
	
	//전 비밀번호가 맞는지 확인
	int checkOldPw = AdminPwHistoryDAO.selectOldPw(oldPw, adminNo);
	//새 비밀번호가 pw내역에 없는지 확인
	int checkNewPw = AdminPwHistoryDAO.selectNewPw(newPw, adminNo);
	// 위 조건을 모두 해당하면 비밀번호 추가
	int insertPw = AdminPwHistoryDAO.insertPw(adminNo, newPw);
	
	if(checkOldPw == 0){ // 예전 비밀번호와 중복된다는 소리
		
		System.out.println("예전 비밀번호와 중복 X");
		response.sendRedirect("/lms/admin/updatePwForm.jsp");
	
	} else { // 예전 비밀번호와 중복되지 않을 경우 newPw가 Pw_History 내역에 없는 비밀번호인지 확인.
		
		if(checkNewPw == 1){
			
			System.out.println("예전 비밀번호와 중복 X");
			response.sendRedirect("/lms/admin/updatePwForm.jsp");
			
		} else {
			
			if (insertPw == 1){ // 최종 성공
				
				System.out.println("최종 성공");
				response.sendRedirect("/lms/admin/myPage.jsp");
				
			} else { // 실패
				
				System.out.println("최종 실패");
				response.sendRedirect("/lms/admin/updatePwForm.jsp");
				
			}
			
		}
		
	}
	
%>
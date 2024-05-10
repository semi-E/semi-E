<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>

<%
	//페이지 진입했는지 확인
	System.out.println("updatePwAction진입");

	String newPw = request.getParameter("newPw");
	System.out.println(newPw + " <-- updatePwAction newPw");

	String oldPw = request.getParameter("oldPw");
	System.out.println(oldPw + " <-- updatePwAction oldPw");
	int adminNo = Integer.valueOf(request.getParameter("adminNo"));
	System.out.println(adminNo + " <-- updatePwAction adminNo");
	
	
	//전 비밀번호가 맞는지 확인
	int checkOldPw = AdminPwHistoryDAO.checkOldPw(oldPw, adminNo);
	int checkNewPw = AdminPwHistoryDAO.checkNewPw(newPw, adminNo);
	int insertPw = AdminPwHistoryDAO.insertPw(adminNo, newPw);
	
	if(checkOldPw == 1){ // 예전 비밀번호와 중복된다는 소리
		
		System.out.println("예전 비밀번호와 중복됩니다");
		response.sendRedirect("/lms/admin/updatePwForm.jsp");
	
	} else { // 예전 비밀번호와 중복되지 않을 경우 newPw가 Pw_History 내역에 없는 비밀번호인지 확인.
		
		if(checkNewPw == 1){
			
			System.out.println("예전 비밀번호와 중복됩니다");
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
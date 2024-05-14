<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*" %>

<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//디버깅
	System.out.println(classApplyNo + " <-- addClassBasketAction classApplyNo");
	System.out.println(studentNo + " <-- addClassBasketAction StudentNo");
	
	// 리스트에 중복값이 있는지 확인
	List<Integer> check = ClassBasketDAO.selectClassBasket(studentNo);
	
	if (check.contains(classApplyNo)){ //이미 값이 있다면 
		System.out.println("같은 강의를 수강할 수 없습니다");
		response.sendRedirect("/lms/student/classApply/classBasketList.jsp");
	} else { // 수강신청 하지 않은 강의라면 실행
		int add = ClassBasketDAO.insertClassBasket(classApplyNo, studentNo);
		
		if(add == 1){ // 장바구니 추가 성공
			System.out.println("장바구니 추가 성공");
			response.sendRedirect("/lms/student/classApply/classBasketList.jsp");
			
		} else { // 장바구니 추가 실패
			System.out.println("장바구니 추가 실패");
			response.sendRedirect("/lms/student/classApply/classApplyList.jsp");
		}
	}
	
	
	
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*" %>

<%
	//세션인증분기 - loginStudent 학생
	if(session.getAttribute("loginStudent") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>

<%	
	
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	
	
	//디버깅
	System.out.println(studentNo + " <-- addMyClassAction StudentNo");
	
	
	ArrayList<HashMap<String, Object>> selectClassBasketList = ClassBasketDAO.selectClassBasketList(studentNo);
	for(HashMap m : selectClassBasketList){
		
			int classApplyNo = (Integer)(m.get("classApplyNo"));
			
			int row = MyclassDAO.insertMyClass(studentNo, classApplyNo);
		
		
			if(row == 1){
				System.out.println("내 강의 추가 성공");
				int  insertGrade = GradeDAO.insertGrade(studentNo, classApplyNo);
				
				if(insertGrade == 1){ // 성공했을 때
					System.out.println("성적 추가 성공");
					for (int week = 1 ;  week <= 15 ; week++ ){
						int insertAttendance = AttendanceDAO.insertAttendance(classApplyNo, studentNo, week);
					}
				} else { //실패했을 때
					System.out.println("성적 추가 실패");
				}
				
				
				
			}else {
				System.out.println("내 강의 추가 실패");	
				response.sendRedirect("/lms/student/classApply/classBasketList.jsp?"); 
			
			}
	}
	System.out.println("내 강의 추가 최종 성공");	
	response.sendRedirect(" /lms/student/class/myClassList.jsp"); 
	
	
%>
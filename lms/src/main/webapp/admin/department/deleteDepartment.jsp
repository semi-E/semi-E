<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lms.dao.*" %>
<%
	// 세션인증분기 - loginAdmin 관리자
	if(session.getAttribute("loginAdmin") == null) {
		response.sendRedirect("/lms/loginForm.jsp");
		return;
	}
%>
<%
	String department = request.getParameter("department");
	System.out.println(department + "<-- deleteDepartment.jsp department");

	
	int selectStudent = StudentDAO.selectStudent(department);
	int selectProfessor = ProfessorDAO.selectProfessor(department);
	//학과 삭제할때 검색
	if(selectStudent==0&&selectProfessor==0){
		//DAO호출
		int deleteDepartment = DepartmentDAO.deleteDepartment(department);
		//학생 찾기 (?)
		
		if(deleteDepartment==1){ //삭제 성공
			System.out.println("학과가 삭제되었습니다");
			response.sendRedirect("/lms/admin/department/departmentList.jsp");
		}else{//삭제 실패
			System.out.println("학과가 삭제되지 않았습니다");
			response.sendRedirect("/lms/admin/department/departmentList.jsp");
		}
	}else{
		System.out.println("교수 또는 학생이 존재합니다");
		response.sendRedirect("/lms/admin/department/departmentList.jsp");
	}
%>	
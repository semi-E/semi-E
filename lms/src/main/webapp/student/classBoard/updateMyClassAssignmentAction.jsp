<%@page import="java.io.OutputStream"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="lms.dao.StudentAssignmentDAO"%>
<%@page import="java.util.HashMap"%>
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
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	int assignmentNo = Integer.parseInt(request.getParameter("assignmentNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Part part = request.getPart("file");  
	String saveName = null;
	if(part.getSize() > 0){
		String originalName = part.getSubmittedFileName();
		String ext = originalName.substring(originalName.lastIndexOf("."));
		String txt = (UUID.randomUUID().toString()).replace("-", "");
		saveName = txt+ext;
	}
	
	//디버깅
	System.out.println(studentNo + "<-- submitMyClassAssignmentAction session studentNo");
	System.out.println(assignmentNo + "<-- submitMyClassAssignmentAction param assignmentNo");
	System.out.println(title + "<-- submitMyClassAssignmentAction param title");
	System.out.println(content + "<-- submitMyClassAssignmentAction param content");
	System.out.println(saveName + "<-- submitMyClassAssignmentAction saveName");
	
	int row = StudentAssignmentDAO.updateStudentAssignment(assignmentNo, studentNo, title, content, saveName);
	
	if(row == 1){
		System.out.println("수정 성공");
		if(saveName != null){
			String uploadPath = request.getServletContext().getRealPath("upload");
			System.out.println(uploadPath);
			
			File file = new File(uploadPath, saveName);
			InputStream inputStream = part.getInputStream();
			OutputStream outputStream = Files.newOutputStream(file.toPath());
			inputStream.transferTo(outputStream);
		}
		response.sendRedirect("/lms/student/classBoard/myClassAssignmentOne.jsp?assignmentNo=" + assignmentNo);
	} else {
		System.out.println("수정 실패");
		response.sendRedirect("/lms/student/classBoard/updateMyClassAssignmentForm.jsp?assignmentNo=" + assignmentNo);
	}
%>
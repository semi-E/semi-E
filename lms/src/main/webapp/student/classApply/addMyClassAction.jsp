<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="lms.dao.*"%>
<%@page import="java.util.*" %>

<%
	int classApplyNo = Integer.parseInt(request.getParameter("classApplyNo"));
	HashMap<String, Object> sessionInfo = (HashMap<String, Object>)(session.getAttribute("loginStudent"));
	int studentNo = (Integer)(sessionInfo.get("studentNo"));
	
	//µð¹ö±ë
	System.out.println(classApplyNo + " <-- addMyClassAction classApplyNo");
	System.out.println(studentNo + " <-- addMyClassAction StudentNo");
%>
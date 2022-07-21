<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = session.getAttribute("userId").toString();
	session.removeAttribute("userId");
	session.setAttribute("loginStatus", false);
	System.out.printf("%s 로그아웃 완료", userId);
	response.sendRedirect("../pages/Index.jsp");
%>
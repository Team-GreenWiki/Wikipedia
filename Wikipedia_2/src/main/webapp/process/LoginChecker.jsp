<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userId") != null){
		System.out.println("LoginChecker : true");
	} else {
		System.out.println("LoginChecker : false");
		JSFunction.alertLocation("로그인 후 이용해주세요", "../pages/Login.jsp", out);
	}
%>
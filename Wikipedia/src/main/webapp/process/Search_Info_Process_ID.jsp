<%@page import="utils.JSFunction"%>
<%@page import="Search.SearchDAO"%>
<%@page import="Search.SearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 폼 값 받아오기 - 아이디 찾기 (닉네임, 이메일 input 상자의 name)
		String nick = request.getParameter("nickName").toString();
		String email_Id = request.getParameter("Email").toString();
		
		// DTO, DAO 객체 생성
		SearchDTO dto = new SearchDTO();
		
		dto.setName(nick);
		dto.setEmail(email_Id);
		
		SearchDAO dao = new SearchDAO(application);
		String result = dao.getSearchId(dto.getName(), dto.getEmail());
		
		if (result != null) {
			JSFunction.alertBack("사용자님의 아이디는 [" + result + "]입니다.", out);
			/* response.sendRedirect("Search_info.jsp"); */
		} else {
			JSFunction.alertBack("값이 저장되지 않았습니다.", out);
		}
	%>
	
	
	
	
</body>
</html>
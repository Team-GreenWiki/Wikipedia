<%@page import="Search.SearchDAO"%>
<%@page import="Search.SearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 폼 값 받아오기 - 아이디 찾기 (닉네임, 이메일 input 상자의 name)
		String name_Id = request.getParameter("nickName").toString();
		String email_Id = request.getParameter("Email").toString();
		
		// DTO, DAO 객체 생성
		SearchDTO dto = new SearchDTO();
		SearchDAO dao = new SearchDAO(application);
		
		int result = 0;
		
		if (name_Id.equals(dto.getName())) {
			dto.setName(name_Id);
			
		}
		
		
		// 폼 값 받아오기 - 비밀번호 찾기
		String id_Pw = request.getParameter("user_Id").toString();
		String email_Pw = request.getParameter("email").toString();
	%>
</body>
</html>
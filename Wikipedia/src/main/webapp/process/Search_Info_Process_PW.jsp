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
			// 폼 값 받아오기 - 비밀번호 찾기
			String id_Pw = request.getParameter("userId").toString();
			String email_Pw = request.getParameter("email").toString();
			
			// DTO, DAO 객체 생성
			SearchDTO dto = new SearchDTO();
			SearchDAO dao = new SearchDAO(application);
			
			dto.setId("userId");
			dto.setEmail("email");
			
			if (id_Pw.equals(dto.getId())) {
				dto.setId(id_Pw);
				
				dao.getSearchPw(dto.getId(), dto.getEmail());
				dao.close();
			}
	%>
</body>
</html>
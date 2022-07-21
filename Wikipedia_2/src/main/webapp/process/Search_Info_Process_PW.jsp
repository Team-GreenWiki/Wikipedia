<%@page import="utils.JSFunction"%>
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
		// 폼 값 받아오기 - 비밀번호 찾기 (아이디, 이메일 input 상자의 name)
		/* System.out.print(request.getParameter("user_Id"));
		System.out.print(request.getParameter("Email"));  - 로그 */
		
		String userId = request.getParameter("user_Id").toString();
		String email_Id = request.getParameter("email").toString();
		
		// DTO, DAO 객체 생성
		SearchDTO dto = new SearchDTO();
		
		dto.setId(userId);
		dto.setEmail(email_Id);
		
		SearchDAO dao = new SearchDAO(application);
		String result2 = dao.getSearchPw(dto.getId(), dto.getEmail());
		
		if (result2 != null) {
			JSFunction.alertBack("사용자님의 비밀번호는 [" + result2 + "]입니다.", out);
			/* response.sendRedirect("Search_info.jsp"); */
		} else {
			JSFunction.alertBack("값이 저장되지 않았습니다.", out);
		}
	%>
</body>
</html>
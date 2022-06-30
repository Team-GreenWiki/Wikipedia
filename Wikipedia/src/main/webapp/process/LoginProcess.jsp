<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Login.jsp에서 전송한 userId와 userPw 저장
	String userId = request.getParameter("input_userId");
	String userPw = request.getParameter("input_userPw");
	System.out.printf("%s / %s 로 로그인 시도\n", userId, userPw);
	
	// 저장한 userId와 userPw로 MemberDTO 생성
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	if(dto.getId() != null){ // 해당 유저가 존재하는지 확인
		System.out.printf("%s 로그인 완료\n", dto.getId());
		session.setAttribute("loginStatus", true);
		response.sendRedirect("../pages/Index.jsp");
	} else { // 해당 유저가 존재하지 않을 때 = 로그인 실패
		System.out.printf("%s 로그인 실패\n", userId);
		request.setAttribute("loginErrMsg", "로그인에 실패하였습니다.");
		request.getRequestDispatcher("../pages/Login.jsp").forward(request, response);
	}
%>
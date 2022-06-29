<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Login.jsp에서 전송한 userId와 userPw 저장
	String userId = request.getParameter("input_userId");
	String userPw = request.getParameter("input_userPw");
	
	// 저장한 userId와 userPw로 MemberDTO 생성
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(userId, userPw);
	
	if(dto.getId() != null){ // 해당 유저가 존재하는지 확인
		session.setAttribute("userId", dto.getId());
	}
%>
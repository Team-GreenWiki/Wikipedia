<%@page import="utils.JSFunction"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// form에서 입력받은 데이터 저장
	String userId = request.getParameter("input_userId");
	String userPw = request.getParameter("input_userPw");
	String userEmail = request.getParameter("input_userEmail");
	String userName = request.getParameter("input_userName");
	
	// 입력받은 데이터로 MemberDTO 생성
	MemberDTO dto = new MemberDTO();
	dto.setId(userId);
	dto.setPw(userPw);
	dto.setEmail(userEmail);
	dto.setName(userName);
	
	// MemberDAO에서 DB에 저장
	MemberDAO dao = new MemberDAO(application);
	int result = dao.signupMember(dto);
	dao.close();
	
	// 결과 판정
	if(result == 1){
		session.setAttribute("userId", dto.getId()); // 로그인상태로 만듬
		JSFunction.alertLocation("회원가입이 완료되었습니다", "../pages/Index.jsp", out); // 메인화면으로 보냄
	} else {
		JSFunction.alertBack("회원가입 중 오류가 발생했습니다", out);
	}
%>
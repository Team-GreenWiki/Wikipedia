<%@page import="utils.JSFunction"%>
<%@page import="FreeBoard.FreeBoardDAO"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="./IsLoggedIn.jsp" %> --%>

<%
	String num = request.getParameter("bnum"); 			// 일련번호 받아오기
	FreeBoardDTO dto = new FreeBoardDTO(); 				// DTO객체 생성
	FreeBoardDAO dao = new FreeBoardDAO(application); 	// DAO 객체 생성
	dto = dao.selectView(num); 							// 기존 일련번호에 해당하는 게시글 가져오기
	
	// 로그인된 사용자 id가져오기
	String sessionId = session.getAttribute("userId").toString();
	
	int delResult = 0;
	
	// 작성자가 본인인지 확인
	if (sessionId.equals(dto.getId())){
		dto.setBnum(num);
		delResult = dao.deletePost(dto);
		dao.close();
		
		if (delResult == 1) {
			JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
		} else {
			JSFunction.alertBack("삭제에 실패했습니다.", out);
		}
	} else {
		JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다.", out);
		
		return;
	}
%>
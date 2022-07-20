<%@page import="utils.JSFunction"%>
<%@page import="FreeBoard.FreeBoardDAO"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="./IsLoggedIn.jsp" %> --%>

<% 
	// 수정한 내용 가져오기
	String bnum = request.getParameter("bnum");
	String btitle = request.getParameter("btitle");
	String bcontent = request.getParameter("bcontent");
	
	// dto에 저장
	FreeBoardDTO dto = new FreeBoardDTO();
	
	dto.setBnum(bnum);
	dto.setBtitle(btitle);
	dto.setBcontent(bcontent);
	
	// DB에 반영
	FreeBoardDAO dao = new FreeBoardDAO(application);
	int affected = dao.updateEdit(dto);
	dao.close();
	
	// 성공/실패 확인
	if (affected == 1) {
		response.sendRedirect("View.jsp?bnum=" + dto.getBnum());
	} else {
		JSFunction.alertBack("수정에 실패했어요 다시 시도하세요.", out);
	}

%>







<%@page import="utils.JSFunction"%>
<%@page import="FreeBoard.FreeBoardDAO"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<%
	// 폼값 받아오기
	String btitle = request.getParameter("btitle");
	String bcontent = request.getParameter("bcontent");

	// 폼값을 DTO객체에 저장
	FreeBoardDTO dto = new FreeBoardDTO();
	dto.setBtitle(btitle);
	dto.setBcontent(bcontent);
	dto.setId(session.getAttribute("userId").toString());
	
	// DAO객체를 통해 DB에 DTO저장
	FreeBoardDAO dao = new FreeBoardDAO(application);
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	if (iResult == 1){
		response.sendRedirect("../pages/FreeBoardList.jsp");	
	} else {
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	
	}
	
%>
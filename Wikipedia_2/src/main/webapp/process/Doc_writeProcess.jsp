<%@page import="utils.JSFunction"%>
<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 깨짐 방지 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
	// 변수 저장
	String userId = session.getAttribute("userId").toString();
	String doc_title = request.getParameter("doc_title");
	String doc_content = request.getParameter("doc_content");
	
	// DAO에 보낼 DTO 생성
	DocumentDTO dto = new DocumentDTO();
	dto.setId(userId);
	dto.setDoc_title(doc_title);
	dto.setDoc_content(doc_content);
	
	// DAO를 통해 DB에 저장
	DocumentDAO dao = new DocumentDAO(application);
	int result = dao.writeDoc(dto);
	dao.close();
	
	// 결과
	if(result == 1){
		JSFunction.alertLocation("새 문서가 성공적으로 저장되었습니다.", "../pages/Doc_list.jsp", out);
	} else {
		JSFunction.alertBack("문서 저장 중 문제가 발생했습니다.", out);
	}
%>
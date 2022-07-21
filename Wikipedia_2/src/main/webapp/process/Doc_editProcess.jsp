<%@page import="utils.JSFunction"%>
<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨짐 방지 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
	// 변수 저장
	String doc_num = request.getParameter("doc_num");
	String doc_title = request.getParameter("doc_title");
	String doc_content = request.getParameter("doc_content");
	
	// DAO에 보낼 DTO 생성
	DocumentDTO dto = new DocumentDTO();
	dto.setDoc_num(doc_num);
	dto.setDoc_title(doc_title);
	dto.setDoc_content(doc_content);
	
	// DAO를 통해 DB의 정보 수정
	DocumentDAO dao = new DocumentDAO(application);
	int result = dao.updateDoc(dto);
	dao.close();
	
	// 결과
	if(result == 1){
		JSFunction.alertLocation("문서가 성공적으로 수정되었습니다.", "../pages/Doc_view.jsp?doc_num=" + doc_num, out);
	} else {
		JSFunction.alertBack("문서 수정 중 문제가 발생했습니다.", out);
	}
%>
<%@page import="utils.JSFunction"%>
<%@page import="document.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 검색어 저장
	String search_type = request.getParameter("search_type");
	String search_word = request.getParameter("search_word");

	// DAO를 통해 해당 문서를 찾고 DTO반환
	DocumentDAO dao = new DocumentDAO(application);
	DocumentDTO dto = dao.searchDoc(search_type, search_word);
	
	String doc_num = dto.getDoc_num();
	
	// 로깅(임시)
	System.out.println("doc_num : " + doc_num);
	
	// 결과
		if(!doc_num.equals("")){
			response.sendRedirect("../pages/Doc_view.jsp?doc_num=" + doc_num);
		} else {
			JSFunction.alertBack("해당하는 문서를 찾을 수 없습니다.", out);
		}
%>
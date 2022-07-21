<%@page import="utils.JSFunction"%>
<%@page import="document.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 검색어 저장
	String type_search = request.getParameter("type_search");
	String input_search = request.getParameter("input_search");

	// DAO를 통해 해당 문서를 찾고 DTO반환
	DocumentDAO dao = new DocumentDAO(application);
	DocumentDTO dto = dao.searchDoc(type_search, input_search);
	
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
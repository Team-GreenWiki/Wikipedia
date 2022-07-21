<%@page import="utils.JSFunction"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/LoginChecker.jsp" %>
<%
	// doc_num 저장
	String doc_num = request.getParameter("doc_num");
	
	// DocumentDAO를 통해 해당 doc_num의 게시글 추천수 올림
	DocumentDAO dao = new DocumentDAO(application);
	int result = dao.upGoodcount(doc_num);
	
	// 결과
	if(result == 1){
		JSFunction.alertLocation("추천되었습니다", "../pages/Doc_view.jsp?doc_num=" + doc_num, out);
	} else {
		JSFunction.alertBack("알 수 없는 문제가 발생했습니다. 다시 시도해주세요", out);
	}
%>
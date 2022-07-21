<%@page import="utils.JSFunction"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../process/LoginChecker.jsp" %>

<%
	// doc_num 저장
	String doc_num = request.getParameter("doc_num");
	
	// DAO를 통해 해당 문서 삭제
	DocumentDAO dao = new DocumentDAO(application);
	int result = dao.deleteDoc(doc_num);
	dao.close();
	
	// 결과
	if(result == 1){
		JSFunction.alertLocation("문서가 성공적으로 삭제되었습니다", "../pages/Doc_list.jsp", out);
	} else {
		JSFunction.alertBack("문서 삭제 중 문제가 발생했습니다", out);
	}
%>
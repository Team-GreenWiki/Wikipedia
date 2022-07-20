<%@page import="comment.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String Tag = request.getParameter("Tag");
	String doc_num = request.getParameter("doc_num");
	CommentDAO dao = new CommentDAO(application);
	List<CommentDTO> comment_Lists = dao.show_comment_list(doc_num, Tag);
	dao.close();
	response.sendRedirect("./Comment_list.jsp?Tag="+Tag+"&doc_num="+doc_num);

%>
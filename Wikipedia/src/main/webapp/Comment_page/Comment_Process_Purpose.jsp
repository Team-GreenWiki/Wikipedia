<%@page import="comment.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String docnum = "39";
	String Tag = "PURPOSE";
	CommentDAO dao = new CommentDAO(application);
	List<CommentDTO> comment_Lists = dao.show_comment_list(docnum, Tag);
	dao.close();
	RequestDispatcher dispatcher = request.getRequestDispatcher("./Comment_list.jsp?Tag=PURPOSE&docnum=39"); 
	dispatcher.forward(request, response);
%>
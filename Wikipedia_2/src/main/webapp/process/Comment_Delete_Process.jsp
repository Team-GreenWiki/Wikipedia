<%@page import="utils.JSFunction"%>
<%@page import="comment.CommentDTO"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String doc_num = request.getParameter("doc_num");
	String comnum = request.getParameter("comnum");
	
	CommentDAO dao = new CommentDAO(application);
	CommentDTO dto = new CommentDTO();
	
	dto.setDoc_num(doc_num);
	dto.setComnum(comnum);
	
	
	int iresult = dao.delete_comment(dto);
	
	if(iresult==1){
		JSFunction.alertLocation("댓글이 성공적으로 삭제 되었습니다.", "../pages/Doc_view.jsp?doc_num="+doc_num+"&comnum"+comnum, out);
	}else{
		JSFunction.alertBack("댓글 삭제에 실패하였습니다.", out);
	}
	


%>
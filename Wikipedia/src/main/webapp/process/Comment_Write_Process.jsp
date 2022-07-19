<%@page import="utils.JSFunction"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userId")==null){
		JSFunction.alertBack("로그인 후 이용해 주세요", out);
	}else{

		String doc_num = request.getParameter("doc_num");
		String Tag = request.getParameter("choiced_Tag");
		String Id = session.getAttribute("userId").toString();
		System.out.println(Id);
		String cocontent = request.getParameter("user_comment_input");
		
		CommentDTO dto = new CommentDTO();
		dto.setDoc_num(doc_num);
		dto.setTag(Tag);
		dto.setId(Id);
		dto.setCocontent(cocontent);
		CommentDAO dao = new CommentDAO(application);
		int iresult = 0;
		iresult = dao.write_comment(dto);
		dao.close();
		
		System.out.println("dto.getDoc_num "+doc_num);
		System.out.println("dto.getTag "+ Tag);
		System.out.println("dto.getCocontent "+ cocontent);
		System.out.println("dto.getId "+ Id);
		
		if(iresult==1){
			System.out.println("댓글 작성 완료");
			response.sendRedirect("../pages/Doc_view.jsp?doc_num="+doc_num);
		}else if(iresult==-2){
			JSFunction.alertBack("태그를 선택해야 댓글 작성이 가능합니다.", out);
		}else{
			System.out.println("댓글 작성 실패");
		}
	}
	
%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <% 
    	String doc_num = request.getParameter("doc_num");
    	String edit_controller = request.getParameter("edit_controller");
    	if(edit_controller=="true"){
    		System.out.println("댓글 수정 페이지로 이동합니다.");
    		response.sendRedirect("../pages/Doc_view.jsp?doc_num="+doc_num);
    	}else if (edit_controller=="false"){
			String Tag = request.getParameter("choiced_Tag");
			String Id = session.getAttribute("userId").toString();
			String cocontent = request.getParameter("edit_textarea");
			//폼과 쿼리스트링으로 넘김 
			
			CommentDAO dao = new CommentDAO(application);
			CommentDTO dto = new CommentDTO();
			dto.setCocontent(cocontent);
			dto.setDoc_num(doc_num);
			dto.setTag(Tag);
			dto.setId(Id);
			
			int iresult = dao.edit_comment(dto);
			
			if(iresult==1){
				System.out.println("댓글 수정에 성공하였습니다.");
				response.sendRedirect("../pages/Doc_view.jsp?doc_num="+doc_num);
			}else{
				System.out.println("댓글 수정에 실패하였습니다.");
			}
    	}
    	
    	
    %>
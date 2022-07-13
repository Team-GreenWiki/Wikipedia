<%@page import="docontent.DocontentDAO"%>
<%@page import="docontent.DocontentDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="document.DocumentDAO"%>
<%@page import="document.DocumentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String docnum = request.getParameter("docnum"); //일련번호 받아오기
	DocumentDTO dto = new DocumentDTO(); //DTO객체 생성
	DocumentDAO dao = new DocumentDAO(application); //DAO객체 생성
	dto = dao.selectView(docnum); //기존 일련번호에 해당하는 게시글 가져오기 
	
	DocontentDTO dto2 = new DocontentDTO();
	DocontentDAO dao2 = new DocontentDAO(application);
	dto2 = dao2.selectView(docnum);

	
	//로그인된 사용자 id가져오기
	String sessionId = session.getAttribute("userId").toString();
	System.out.println("dto.id : "+dto.getId());
	int delResult = 0;
	
	//작성자가 본인인지 확인 
	if(sessionId.equals(dto.getId())){
		dto.setDocnum(docnum);
		delResult = dao.deleteDocument(dto);
		delResult = dao2.deleteDocontent(dto2);
		dao.close();
		dao2.close();
		System.out.println("delResult : "+delResult);
		if(delResult==1){
			JSFunction.alertLocation("삭제되었습니다.", "./Document_list.jsp", out);
			
		}else{
			JSFunction.alertBack("삭제에 실패했습니다.", out);
		}
		
	}else {
		JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다."+sessionId+" "+dto.getId(), out);
		return;
	}

%>
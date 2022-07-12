<%@page import="utils.JSFunction"%>
<%@page import="docontent.DocontentDAO"%>
<%@page import="docontent.DocontentDTO"%>
<%@page import="document.DocumentDTO"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%	String title = request.getParameter("title");
	String subtitle1  = request.getParameter("subtitle1");
	String subtitle2  = request.getParameter("subtitle2");
	String subtitle3  = request.getParameter("subtitle3");
	String subtitle4  = request.getParameter("subtitle4");
	String subtitle5  = request.getParameter("subtitle5");	
	String content1 = request.getParameter("content1");
	String content2 = request.getParameter("content2");
	String content3 = request.getParameter("content3");
	String content4 = request.getParameter("content4");
	String content5 = request.getParameter("content5");
	
	
	
	String id = session.getAttribute("userId").toString();
	DocumentDTO dto2 = new DocumentDTO();
	//세션에서 로그인한 아이디를 가져오고, form에서 받은 문서 제목을 가져옴
	
	dto2.setTitle(title);
	dto2.setId(id);
	DocumentDAO dao2 = new DocumentDAO(application);
	System.out.println("result = " + dao2.validateTitle(title));
	if(dao2.validateTitle(title) == 0){
		JSFunction.alertBack("이미 같은 제목의 문서가 존재합니다.", out);
		return;
	}
	dao2.writeDocument(dto2);
	
	//문서의 dto2 객체를 만들어서 docnum을 시퀀스로 생성함
	dto2 = dao2.selectView(dto2);
	String docnum = dto2.getDocnum();
	
	
	
	//write form에서 작성한 내용을 가져옴
	
	DocontentDTO dto = new DocontentDTO();
	dto.setDocnum(docnum);
	dto.setSubtitle1(subtitle1);
	dto.setSubtitle2(subtitle2);
	dto.setSubtitle3(subtitle3);
	dto.setSubtitle4(subtitle4);
	dto.setSubtitle5(subtitle5);
	dto.setContent1(content1);
	dto.setContent2(content2);
	dto.setContent3(content3);
	dto.setContent4(content4);
	dto.setContent5(content5);
	
	//가져온 내용을 dto에 담음
	
	
	DocontentDAO dao = new DocontentDAO(application);
	//문서내용DAO에서 문서내용을 DB로 저장하는 write 메서드 호출
	
	
	 
	int iresult = dao.writeDocontent(dto,dto2);
	//
	
	dao.close();
	dao2.close();
	
	if(iresult==1){
		response.sendRedirect("Document_list.jsp");
	}else{
		JSFunction.alertBack("문서 작성에 실패하였습니다.",out);
	}
	
	
	

%>
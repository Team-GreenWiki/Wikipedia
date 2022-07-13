<%@page import="utils.JSFunction"%>
<%@page import="docontent.DocontentDAO"%>
<%@page import="docontent.DocontentDTO"%>
<%@page import="document.DocumentDAO"%>
<%@page import="document.DocumentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String docnum = request.getParameter("docnum");
	String title = request.getParameter("title");
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
	//edit 페이지에서 작성한 내용을 가져옴
	
	
	DocumentDTO dto = new DocumentDTO();
	DocumentDAO dao = new DocumentDAO(application);
	dto.setDocnum(docnum);
	dto.setTitle(title);
	dao.editDocument(dto);
	//문서 객체를 통해 edit 페이지에서 가져온 글의 제목으로 수정 
	
	
	DocontentDTO dto2 = new DocontentDTO();
	dto2.setSubtitle1(subtitle1);
	dto2.setSubtitle2(subtitle2);
	dto2.setSubtitle3(subtitle3);
	dto2.setSubtitle4(subtitle4);
	dto2.setSubtitle5(subtitle5);
	dto2.setContent1(content1);
	dto2.setContent2(content2);
	dto2.setContent3(content3);
	dto2.setContent4(content4);
	dto2.setContent5(content5);
	dto2.setDocnum(docnum);
	//가져온 내용들을 문서내용 객체에 저장
	
	DocontentDAO dao2 = new DocontentDAO(application);
	int iresult = dao2.editDocontent(dto2);
	System.out.println("iresult"+iresult);
	
	dao.close();
	dao2.close();
	
	if(iresult==1){
		response.sendRedirect("./Document_view.jsp?docnum="+dto.getDocnum());
	}else{
		JSFunction.alertBack("수정하는데 실패했어요", out);
	}
	
%>
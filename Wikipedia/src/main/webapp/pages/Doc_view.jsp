<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DocumentDAO dao = new DocumentDAO(application);

	// 불러올 문서의 doc_num 저장
	String call_doc_num = "";
	DocumentDTO dto;
	if(request.getParameter("doc_num").equals("rnd")){
		List<DocumentDTO> list = dao.getAllDocument();
		int index = (int)(Math.floor(Math.random() * list.size()));
		dto = list.get(index);
	} else {
		call_doc_num = request.getParameter("doc_num");
	
		// DAO를 통해 해당 doc_num의 문서 DTO 반환
		dto = dao.getDocumentDTO(call_doc_num);
		dao.close();
	}
	
	// 변수에 저장
	String doc_num = dto.getDoc_num();
	String id = dto.getId();
	String doc_title = dto.getDoc_title();
	String doc_content = dto.getDoc_content();
	String goodcount = dto.getGoodcount();
	String writedate = dto.getWritedate().toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/Doc_view.css" rel="stylesheet"></link>
</head>
<body>
	<%@ include file="../include/Header.jsp" %>

	<section class="container">
		<table border="1">
			<tr>
				<td width="10%" align="center">문서번호</td>
				<td width="10%" align="center"><%= doc_num %></td>
				<td colspan="4" width="*"><h2><%= doc_title %></h2></td>
			</tr>
			<tr>
				<td width="10%" align="center">작성자</td>
				<td width="20%" align="center"><%= id %></td>
				<td width="15%" align="center">추천</td>
				<td width="15%" align="center"><%= goodcount %></td>
				<td width="15%" align="center">작성일</td>
				<td width="25%" align="center"><%= writedate %></td>
			</tr>
			<tr>
				<td colspan="6"><div id="contentArea"><%= doc_content %></div></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<button type="button" onclick="location.href='../pages/Doc_edit.jsp?doc_num=<%= doc_num %>'">수정하기</button>
				</td>
			</tr>
		</table>
			
		<%
		String Tag = request.getParameter("Tag");
		String edit_controller = request.getParameter("edit_controller");
		String comnum = request.getParameter("comnum");
		System.out.println("comnum : "+comnum);
		
		CommentDAO comment_dao = new CommentDAO(application);
		List<CommentDTO> comment_Lists = null;
		CommentDTO comment_dto_edit = null;
				
		if(Tag==null||Tag=="ALL"){
			System.out.println("Tag가 null 이므로 모든 댓글을 불러옴");
			comment_Lists = comment_dao.show_comment_list(doc_num, "ALL");
		}else { 
			System.out.println("Tag가 "+Tag+"이므로 해당 태그의 댓글을 불러옴");
			comment_Lists = comment_dao.show_comment_list(doc_num, Tag);
		}
		// 처음 로딩할때 all 불러오기 위한 if문 
		
		System.out.println("edit_controller : "+edit_controller);
		if(edit_controller!=null){
			System.out.println("컨트롤러 호출");
			comment_dto_edit  = comment_dao.bring_origin_comment(comnum);
			//수정하기 프로세스를 거쳐왔다는뜻 
		}

		int total_tag = comment_dao.count_all_comment(doc_num);
		ArrayList<Integer> tag_count_list = comment_dao.count_Tags(doc_num);
		int purpose_tag = tag_count_list.get(0);
		int using_tag = tag_count_list.get(1);
		int moreinfo_tag = tag_count_list.get(2);
		int qna_tag = tag_count_list.get(3);
		
		
		comment_dao.close();
		
		
	%>
	<div class="comment_div">
		<form action="../process/Comment_Write_Process.jsp?doc_num=<%=doc_num %>" method="post" name="comment_write_form">
			<table border='1' width="60%" align="center">
				<tr>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=ALL&doc_num=<%=doc_num %>'" type="button">ALL(<%=total_tag %>)</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=PURPOSE&doc_num=<%=doc_num %>'" type="button">PURPOSE(<%=purpose_tag %>)</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=USING&doc_num=<%=doc_num %>'" type="button">USING(<%=using_tag %>)</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=MOREINFO&doc_num=<%=doc_num %>'" type="button">MOREINFO(<%=moreinfo_tag %>)</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=QNA&doc_num=<%=doc_num %>'" type="button">QNA(<%=qna_tag %>)</button></td>
					
				</tr>
				<tr>
					<td colspan='5'>
						<div class="comment_input">
							<select name="choiced_Tag">
								<option>태그를 선택하세요.</option>
								<option>PURPOSE</option>
								<option>USING</option>
								<option>MOREINFO</option>
								<option>QNA</option>
							</select>
							<textarea class="comment_textarea" placeholder="댓글을 입력하세요" name="user_comment_input" ></textarea>
							<button class="comment_write_btn" type="submit">작성</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="comment_lists_box">
		<%if(comment_Lists.isEmpty()) {%>
				<p>아직 댓글이 없습니다.</p>
		<%}else{ 
			for(CommentDTO comment_dto : comment_Lists){
		%>
			<div class="comment_list_content">
				<div class="comment_list_content_info">
					<p> [<%=comment_dto.getTag() %>]  <%=comment_dto.getId() %>  <%= comment_dto.getWritedate() %>
					<%if(comment_dto.getId().equals(session.getAttribute("userId"))) { %>
					<button class="edit_delete_btn" onclick="location.href='../process/Comment_Delete_Process.jsp?comnum=<%=comment_dto.getComnum()%>&doc_num=<%=comment_dto.getDoc_num()%>'">x</button>
					<button class="edit_delete_btn" onclick="location.href='../process/Comment_Edit_Process.jsp?comnum=<%=comment_dto.getComnum()%>&edit_controller=true&doc_num=<%=doc_num%>'">수정하기</button>
					</p>
					<%} %>
				</div>
				<div class="comment_list_content_text">
					<p><%= comment_dto.getCocontent() %></p>
				</div>
			</div>
		<%		} 
		  }
		%>
	</div>
	
	<!-- 댓글 수정하기 버튼을 누르면 만들어지는 댓글 수정 창 입니다. -->
	<%if(edit_controller!=null){ 
	System.out.println("edit_modal이 생성된 후 doc_num : "+doc_num);
	System.out.println("edit_modal이 생성된 후 comnum : "+comnum);
	%>
	<div class="edit_modal">
		<form method="post" action="../process/Comment_Edit_Process.jsp?doc_num=<%=doc_num%>&Tag=choiced_Tag&edit_controller=false&comnum=<%=comnum%>">
			<p>댓글 수정 창</p>
			<hr>
			<p>[<%=comment_dto_edit.getTag() %>] <%=comment_dto_edit.getId() %>  <%= comment_dto_edit.getWritedate() %></p>
			<hr>
			<select name="choiced_Tag">
				<option>태그를 선택하세요.</option>
				<option>PURPOSE</option>
				<option>USING</option>
				<option>MOREINFO</option>
				<option>QNA</option>
			</select>
			<textarea class="comment_textarea" placeholder="댓글을 입력하세요" name="edit_textarea"><%=comment_dto_edit.getCocontent() %></textarea>
			<button type="submit">수정완료</button>
			<button type="button" onclick="close_modal()">취소</button>
		</form>
	</div>
	<%} %>
		
	</section>
	
	
	<script>
		let contentArea = document.getElementById("contentArea");
		for(i = 0; i < contentArea.children.length; i++){
			contentArea.children[i].setAttribute("readonly", "true");
		}		
		function close_modal(){
	           history.back();
	    }
		
		let 
		
	</script>
</body>
</html>
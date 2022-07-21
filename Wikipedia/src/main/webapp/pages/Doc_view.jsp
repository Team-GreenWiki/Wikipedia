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
<style>
	#contentArea{
		display: flex;
		flex-direction: column;
	}
	/* 태그 버튼을 감싸는 td */
	.comment_Tag{
	background-color: gray;
	}
	
	/* 댓글 입력창인 textarea */
	.comment_textarea {
			width: 70%;
			height: 50px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
			margin-left:20px;
			margin-top : 15px;
		}
		
	/* 댓글 작성 버튼 */
	.comment_write_btn{
		width:60px;
		height:50px;
	}
	
	/* 댓글 입력창 전체를 감싸는 div */
	.comment_input{
		text-align:center;
	}
	
	/* 댓글 리스트를 감싸는 div */
	.comment_lists_box{
		width:60%;
		margin: 0 auto;
		border:1px solid gray;
		background-color:#fff;
	}
	
	/* 하나의 댓글을 감싸는 div */
	.comment_list_content{
		border:3px solid gray;
	}
	
	/* 하나의 댓글의 작성자 정보,작성일등의 정보를 감싸는 div */
	.comment_list_content_info{
		border-bottom:1px solid gray;
	}
	/* 하나의 댓글의 댓글내용을 감싸는 div */
	.comment_list_content_text{
		font-size:14px;
	}
</style>
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
					<button type="button" onclick="location.href='../pages/Doc_edit.jsp?doc_num=<%= doc_num %>'">수정 / 삭제</button>
					<button type="button" onclick="location.href='../pages/Doc_list.jsp'">돌아가기</button>
				</td>
			</tr>
		</table>
		
		<%-- <%@ include file="../Comment_page/Comment_list.jsp" %>
		<jsp:include page="../Comment_page/Comment_list.jsp"></jsp:include> --%>
		
	</section>
	<%
		String Tag = request.getParameter("Tag");
		String edit_controller = request.getParameter("edit");
		
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
		
		
		if(edit_controller!=""){
			comment_dto_edit  = new CommentDTO();
			//수정하기 프로세스를 거쳐왔다는뜻 
		}

		
		
		
		comment_dao.close();
		
		
	%>
	<div class="comment_div">
		<form action="../process/Comment_Write_Process.jsp?doc_num=<%=doc_num %>" method="post" name="comment_write_form">
			<table border='1' width="60%" align="center">
				<tr>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=ALL&doc_num=<%=doc_num %>'" type="button">ALL</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=PURPOSE&doc_num=<%=doc_num %>'" type="button">PURPOSE</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=USING&doc_num=<%=doc_num %>'" type="button">USING</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=MOREINFO&doc_num=<%=doc_num %>'" type="button">MOREINFO</button></td>
					<td class="comment_Tag"><button onclick="location.href='../process/Comment_Process.jsp?Tag=QNA&doc_num=<%=doc_num %>'" type="button">QNA</button></td>
					
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
					<button class="edit_delete_btn" onclick="location.href='../process/Comment_Delete_Process.jsp?comnum=<%=comment_dto.getComnum()%>'">x</button>
					<button class="edit_delete_btn" onclick="location.href='../process/Comment_Edit_Process.jsp?comnum=<%=comment_dto.getComnum()%>&edit_controller=true'">수정하기</button>
					</p>
					<%} %>
				</div>
				<div class="comment_list_content_text">
				<%if(edit_controller==null) {%>
					<p><%= comment_dto.getCocontent() %></p>
				<%}else{ %>
				<form action="../process/Comment_Edit_Process.jsp?doc_num=<%=doc_num%>&Tag=choiced_Tag&edit_controller=false">
					<select name="choiced_Tag">
									<option>태그를 선택하세요.</option>
									<option>PURPOSE</option>
									<option>USING</option>
									<option>MOREINFO</option>
									<option>QNA</option>
					</select>
					<textarea class="comment_textarea" placeholder="댓글을 입력하세요" name="edit_textarea"><%=comment_dto_edit.getCocontent() %></textarea>
					<button type="submit">수정완료</button>
					<button type="reset">취소</button>
				</form>
				<% }%>
				</div>
			</div>
		<%		} 
		  }
		%>
	</div>
	
	<script>
		let contentArea = document.getElementById("contentArea");
		for(i = 0; i < contentArea.children.length; i++){
			contentArea.children[i].setAttribute("readonly", "true");
		}
		
		let content = document.getElementsByClassName("content");
		for(i = 0; i < content.length; i++){
			content[i].style.height = content[i].scrollHeight + "px";
		}
		
	</script>
</body>
</html>
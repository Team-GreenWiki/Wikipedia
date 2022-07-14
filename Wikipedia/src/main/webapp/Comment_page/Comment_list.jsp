<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	/* 태그 버튼을 감싸는 td */
	.comment_Tag{
	background-color: gray;
	}
	
	/* 댓글 입력창인 textarea */
	textarea {
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
</head>
<body>	
	<p>39번 문서</p>

<%
	String docnum = "39";
	String Tag = request.getParameter("Tag");
	System.out.println("Tag  = "+Tag);
	CommentDAO dao = new CommentDAO(application);
	List<CommentDTO> comment_Lists = null;
			
	if(Tag==null||Tag=="ALL"){
		System.out.println("Tag가 null 이므로 모든 댓글을 불러옴");
		comment_Lists = dao.show_comment_list(docnum, "ALL");
	}else {
		System.out.println("Tag가 "+Tag+"이므로 해당 태그의 댓글을 불러옴");
		comment_Lists = dao.show_comment_list(docnum, Tag);
	}
	
	dao.close();
%>
	<div>
		<form action="../Comment_Process.jsp" method="post" name="comment_write_form">
			<table border='1' width="60%" align="center">
				<tr>
					<td class="comment_Tag"><button onclick="location.href='Comment_Process_All.jsp?'" type="button">ALL</button></td>
					<td class="comment_Tag"><button onclick="location.href='Comment_Process_Purpose.jsp?'" type="button">PURPOSE</button></td>
					<td class="comment_Tag"><button onclick="location.href='Comment_Process_Using.jsp?'" type="button">USING</button></td>
					<td class="comment_Tag"><button onclick="location.href='Comment_Process_Moreinfo.jsp?'" type="button">MOREINFO</button></td>
					<td class="comment_Tag"><button onclick="location.href='Comment_Process_Qna.jsp?'" type="button">QNA</button></td>
					
				</tr>
				<tr>
					<td colspan='5'>
						<div class="comment_input">
							<select>
								<option>태그를 선택하세요.</option>
								<option>PURPOSE</option>
								<option>USING</option>
								<option>MOREINFO</option>
								<option>QNA</option>
							</select>
							<textarea placeholder="댓글을 입력하세요" name="user_comment_input" ></textarea>
							<!-- 플레이스 홀더 안에 선택한 태그 표시 기능을 el등을 이용해서 표시 기능 추가해야함 -->
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
			for(CommentDTO dto : comment_Lists){
		%>
			<div class="comment_list_content">
				<div class="comment_list_content_info">
					<p> [<%=dto.getTag() %>]  <%=dto.getId() %>  <%= dto.getWritedate() %></p>
				</div>
				<div class="comment_list_content_text">
					<p><%= dto.getCocontent() %></p>
				</div>
			</div>
		<%		} 
		  }
		%>
	</div>
	
	<script>
	
	</script>
</body>
</html>
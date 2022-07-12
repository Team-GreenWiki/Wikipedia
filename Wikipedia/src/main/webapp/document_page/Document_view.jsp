<%@page import="docontent.DocontentDTO"%>
<%@page import="docontent.DocontentDAO"%>
<%@page import="document.DocumentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.comment_Tag{
	background-color: gray;
	}
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
	.comment_write_btn{
		width:60px;
		height:50px;
	}
	.comment_input{
		text-align:center;
	}
</style>
</head>
<body>

<%
	String docnum = request.getParameter("docnum");
	DocumentDAO dao = new DocumentDAO(application);
	DocumentDTO dto = dao.selectView(docnum); 
	
	DocontentDAO dao2 = new DocontentDAO(application);
	DocontentDTO dto2 = dao2.selectView(docnum);
	
	
%>
	
	
	
	<!-- 댓글기능 확인을 위한 임시 문서 jsp입니다. -->
	
	<!-- dto 는 문서 정보에 대한 객체
		dto2 는 문서 내용에 대한 객체
	 -->
	
	
	<h2>문서</h2>
	<hr>
	<table width="80%" align="center">
		<h2> <%=dto.getTitle() %> </h2> 

		<tr>
			<td> <%=dto2.getSubtitle1() %></td>
		</tr>
		<tr>
			<td> <%=dto2.getContent1() %></td>
		</tr>
		<tr>
			<td><%=dto2.getSubtitle2() %></td>
		</tr>
		<tr>
			<td><%=dto2.getContent2() %></td>
		</tr>
		<tr>
			<td><%=dto2.getSubtitle3() %></td>
		</tr>
		<tr>
			<td><%=dto2.getContent3() %></td>
		</tr>
		<tr>
			<td><%=dto2.getSubtitle4() %></td>
		</tr>
		<tr>
			<td><%=dto2.getContent4() %></td>
		</tr>
		<tr>
			<td><%=dto2.getSubtitle5() %></td>
		</tr>
		<tr>
			<td><%=dto2.getContent5() %></td>
		</tr>
		<br/><br/><br/>
		<hr>
	</table>
	<br>
	<div align="center">
		<button type="button" onclick="location.href='./Document_Write.jsp'">새 문서 작성하기</button>
		<button type="button" onclick="location.href='./Document_Edit.jsp?docnum=<%=dto.getDocnum()%>'">이 문서 수정하기</button>
		<button type="button" onclick="location.href='./Document_Delete.jsp'">이 문서 삭제하기</button>
		<button type="button" onclick="location.href='./Document_list.jsp'">목록으로</button>
	</div>
	
	
	<br/><br/>
	<hr>
	<form action="../Comment_view.jsp" method="post" name="comment_write_form">
		<table border='1' width="40%" align="center">
			<tr>
				<td class="comment_Tag"><button onclick="">ALL</button></td>
				<td class="comment_Tag"><button onclick="">PURPOSE</button></td>
				<td class="comment_Tag"><button onclick="">USING</button></td>
				<td class="comment_Tag"><button onclick="">MOREINFO</button></td>
				<td class="comment_Tag"><button onclick="">QNA</button></td>
				
			</tr>
			<tr>
				<td colspan='5'>
					<div class="comment_input">
						<textarea placeholder="댓글을 입력하세요" name="user_comment_input"></textarea>
						<!-- 플레이스 홀더 안에 선택한 태그 표시 기능을 el등을 이용해서 표시 기능 추가해야함 -->
						<button class="comment_write_btn" type="submit">작성</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	

	
			

	
	
</body>
</html>
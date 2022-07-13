<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 불러올 문서의 doc_num 저장
	String call_doc_num = request.getParameter("doc_num");

	// DAO를 통해 해당 doc_num의 문서 DTO 반환
	DocumentDAO dao = new DocumentDAO(application);
	DocumentDTO dto = dao.getDocumentDTO(call_doc_num);
	dao.close();
	
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
</head>
<style>
	#contentArea{
		display: flex;
		flex-direction: column;
	}
</style>
<body>
	<section>
		<table border="1">
			<tr>
				<td>문서번호</td>
				<td><%= doc_num %></td>
				<td colspan="4"><h2><%= doc_title %></h2></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= id %></td>
				<td>추천</td>
				<td><%= goodcount %></td>
				<td>작성일</td>
				<td><%= writedate %></td>
			</tr>
			<tr>
				<td colspan="6"><div id="contentArea"><%= doc_content %></div></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<button type="button" onclick="location.href='../pages/Doc_edit.jsp?doc_num=<%= doc_num %>'">수정하기</button>
					<button type="button">삭제하기</button>
				</td>
			</tr>
		</table>
	</section>
	
	<script>
		let contentArea = document.getElementById("contentArea");
		for(i = 0; i < contentArea.children.length; i++){
			contentArea.children[i].setAttribute("readonly", "true");
		}
	</script>
</body>
</html>
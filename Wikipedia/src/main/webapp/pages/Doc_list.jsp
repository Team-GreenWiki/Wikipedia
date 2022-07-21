<%@page import="java.util.*"%>
<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 검색어 저장
	String search_type = request.getParameter("search_type");
	String search_word = request.getParameter("search_word");

	// 문서 목록 불러오기
	DocumentDAO dao = new DocumentDAO(application);
	List<DocumentDTO> list = dao.searchDocList(search_type, search_word);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/Doc_list.css" rel="stylesheet"></link>
</head>
<body>
	<%@ include file="../include/Header.jsp" %>

	<section class="container">
		<h2>문서 목록</h2>
		<form action="../pages/Doc_list.jsp">
			<table border="1">
				<tr>
					<td colspan="5" align="center">
						<select name="search_type">
							<option value="doc_title">제목</option>
							<option value="doc_content">내용</option>
							<option value="id">작성자</option>
							<option value="doc_num">문서번호</option>
						</select>
						<input type="text" name="search_word" />
						<button type="submit">검색</button>
					</td>
				</tr>
				<tr>
					<th width="10%">문서번호</th>
					<th width="*">제목</th>
					<th width="15%">작성자</th>
					<th width="10%">추천수</th>
					<th width="10%">작성일</th>
				</tr>
				<%
					if(list.isEmpty()){
				%>
					<tr>
						<td colspan="5" align="center">문서가 없습니다</td>
					</tr>
				<%
					} else {
						for(DocumentDTO dto : list){
				%>
							<tr>
								<td align="center"><%= dto.getDoc_num() %></td>
								<td><a href="../pages/Doc_view.jsp?doc_num='<%= dto.getDoc_num() %>'"><%= dto.getDoc_title() %></a></td>
								<td align="center"><%= dto.getId() %></td>
								<td align="center"><%= dto.getGoodcount() %></td>
								<td align="center"><%= dto.getWritedate() %></td>
							</tr>
				<%	
						}
					}
				%>
			</table>
		</form>
	</section>
</body>
</html>
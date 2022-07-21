<%@page import="java.util.*"%>
<%@page import="document.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 문서 목록 불러오기
	DocumentDAO dao = new DocumentDAO(application);
	List<DocumentDTO> list = dao.getAllDocument();
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
		<table border="1">
			<tr>
				<td colspan="5" align="center">(검색창 구현 예정)</td>
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
	</section>
</body>
</html>
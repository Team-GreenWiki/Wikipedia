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
</head>
<body>
	<section>
		<h2>문서 목록</h2>
		<table border="1">
			<tr>
				<td colspan="5">(검색창 구현 예정)</td>
			</tr>
			<tr>
				<th>문서번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>추천수</th>
				<th>작성일</th>
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
							<td><%= dto.getDoc_num() %></td>
							<td><a href="../pages/Doc_view.jsp?doc_num='<%= dto.getDoc_num() %>'"><%= dto.getDoc_title() %></a></td>
							<td><%= dto.getId() %></td>
							<td><%= dto.getGoodcount() %></td>
							<td><%= dto.getWritedate() %></td>
						</tr>
			<%	
					}
				}
			%>
		</table>
	</section>
</body>
</html>
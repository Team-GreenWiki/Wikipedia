<%@page import="FreeBoard.FreeBoardDAO"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	FreeBoardDAO dao = new FreeBoardDAO(application);
	
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	//검색어가 있으면
	if (searchWord != null){
		param.put("searchField", searchField);	
		param.put("searchWord", searchWord);	
	}
	
	int totalCount = dao.selectCount(param);
	
	List<FreeBoardDTO> boardLists = dao.selectList(param);
	dao.close();

%>   
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./Link.jsp"></jsp:include>
	
	<h2> 목록 보기</h2>
	<form method="get">
		<table border ="1" width="90%">
			<tr align="center">
				<td>
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 테이블  -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<%
			if (boardLists.isEmpty()) {
				//게시물이 하나도 없으면
		%>
				<tr>
					<td colspan="5" align="center">
						등록된 게시물이 없습니다.
					</td>
				</tr>
		<%	
			} else {
				//게시물이 있으면
				int virtualNum = 0;
				for (FeeBoardDTO dto : boardLists) {
					virtualNum = totalCount--;
		%>
					<tr align="center">
						<td align="center"><%=virtualNum %></td> <!-- 게시물번호 -->
						<td align="center"> <!-- 제목(하이퍼링크) -->
							<a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
						</td>
						<td align="center"> <%=dto.getId() %></td>
						<td align="center"> <%=dto.getVisitcount() %></td>
						<td align="center"> <%=dto.getPostdate() %></td>
					</tr>
		<%	
				}
				
			}
		%>
	</table>
	
	<table>
		<tr>
			<td>
				<button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>
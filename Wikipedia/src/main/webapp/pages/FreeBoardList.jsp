<%@page import="FreeBoard.FreeBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="FreeBoard.FreeBoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	FreeBoardDAO dao = new FreeBoardDAO(application);
	
	Map<String, Object> param = new HashMap<String, Object>();
	
	// searchField, searchWord (input창)의 값을 가져와 각 변수에 저장 
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	//검색어가 있으면
	if (searchWord != null){
		param.put("searchField", searchField);	
		param.put("searchWord", searchWord);	
	}
	
	// 게시글 개수를 세는 메서드를 totalCount 변수에 저장
	int totalCount = dao.selectCount(param);
	
	// 게시물 목록을 반환하는 메서드를 FreeboardLists 변수에 저장
	List<FreeBoardDTO> FreeboardLists = dao.selectList(param);
	
	dao.close();

%>   
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../css/FreeBoardList.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/Header.jsp"></jsp:include>
	
	<section class="FreeBoardList">
		<h2> 목록 보기</h2>
		<form method="get">
			<table border ="1" width="90%">
				<tr align="center">
					<td>
						<select name="searchField">
							<option value="choice">선택하세요.</option>
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
				<th width="15%">작성일</th>
			</tr>
			
			<%
				if (FreeboardLists.isEmpty()) {
					// 게시물이 하나도 없으면(=없다면)
			%>
					<tr>
						<td colspan="5" align="center">
							등록된 게시물이 없습니다.
						</td>
					</tr>
			<%	
				} else {
					// 게시물이 있으면(=있다면)
					int virtualNum = 0;
					for (FreeBoardDTO dto : FreeboardLists) {
						virtualNum = totalCount--;
			%>
						<tr align="center">
							<td align="center"><%=virtualNum %></td> <!-- 게시물번호 -->
							<td align="center"> <!-- 제목(하이퍼링크) -->
								<a href="FreeBoardView.jsp?bnum=<%=dto.getBnum() %>"><%=dto.getBtitle() %></a>
							</td>
							<td align="center"> <%=dto.getId() %></td>
							<td align="center"> <%=dto.getBwritedate() %></td>
						</tr>
			<%	
					}
					
				}
			%>
		</table>
	
	
	
		<table>
			<tr>
				<td>
					<button type="button" onclick="location.href='FreeBoardWrite.jsp'">작성하기</button>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>







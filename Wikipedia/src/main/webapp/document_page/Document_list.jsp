<%@page import="utils.DocumentPage"%>
<%@page import="document.DocumentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	 <%
	   DocumentDAO dao = new DocumentDAO(application);
	   
	   Map<String,Object> param = new HashMap<String,Object>();
	   
	   String searchField = request.getParameter("searchField");
	   String searchWord = request.getParameter("searchWord");
	   
	   if(searchWord !=null){
		   param.put("searchField", searchField);
		   param.put("searchWord", searchWord);
	   }
	   
	   List<DocumentDTO> DocumentLists = dao.selectListPage(param);
   		
	   //게시물 수 확인
	   int totalCount = dao.selectCount(param);
	   
	   //페이징 처리
	   //전체 페이지 수 계산 
	   int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	   int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	   //결과가 나누어 떨어지지 않으면 반드시 올림처리를 해서 나머지를 표시해야함
	   int totalPage = (int)(Math.ceil((double)totalCount / pageSize));
	   
	   //현재 페이지 확인
	   int pageNum = 1;
	   String pageTemp = request.getParameter("pageNum");
	   if(pageTemp !=null && !pageTemp.equals("")){
		   pageNum = Integer.parseInt(pageTemp);
	   }
	   
	   //목록에 출력할 게시물의 범위 확인 
	   int start = (pageNum -1) * pageSize +1; // 첫 게시물의 번호 
	   int end = pageNum * pageSize; // 마지막 게시물의 번호
	   
	   param.put("start", start);
	   param.put("end", end);
	   
	   dao.close();
	   
   %>
   
   <form action="" method="get">
		<table border="1" width="60%">
			<tr align = "center">
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
	
	<table border='1' width="60%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>추천수</td>
			<td>게시일</td>
		</tr>
		<%
			if(DocumentLists.isEmpty()){
		%>	
			<tr>
				<td colspan='5' align="center">게시물이 존재하지 않습니다.</td>
			<tr>
			
		<%
		}else{
			int virtualNum = 0;
			int countNum = 0;
			
			for(DocumentDTO dto : DocumentLists){
				virtualNum = totalCount - (((pageNum -1) * pageSize) +countNum++);
				
			%>
			<tr align='center'>
				<td align='center'><%=virtualNum %></td>
				<td align='center'>
					<a href='Document_1_view.jsp?docnum=1'><%=dto.getDocnum() %><%=dto.getTitle() %></a>
				</td>
				<td align='center'><%=dto.getId() %></td>
				<td align='center'><%=dto.getGoodcount() %></td>
				<td align='center'><%=dto.getWritedate() %></td>
			</tr>
		<% 
			}
		}
		%>
		
	</table>
   
   
   
   
</body>
</html>
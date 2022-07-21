<%@page import="oracle.net.jdbc.nl.NVNavigator"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@page import="FreeBoard.FreeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	String num = request.getParameter("bnum");				// 일련번호 매개변수
	FreeBoardDAO dao = new FreeBoardDAO(application);   	// DAO객체 생성
	FreeBoardDTO dto = dao.selectView(num);					// 게시글 가져오기
	dao.close(); 											// 연결끊기
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/FreeBoardView.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@ include file="../include/Header.jsp" %>
	
	<script>
		function deletePost(){
			let confirmed = confirm("정말로 삭제하시겠어요?");
			
			if (confirmed) {
				let form = document.writeFrm;
				form.method="post";
				form.action="../process/FreeBoardDeleteProcess.jsp";
				form.submit();
			}
		}
	</script>


	<section class="FreeBoardView">
		<h2>자유게시판</h2>
	
		<form name ="writeFrm">
		
			<input type="hidden" name="bnum" value="<%=num%>">
			
			<table border="1" width ="90%">
				<tr>
					<td>번호</td>
					<td><%=dto.getBnum() %></td>
					<td>작성자</td>
					<td><%=dto.getId() %></td>
				</tr>
				
				<tr>
					<td>작성일</td>
					<td><%=dto.getBwritedate() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"> <%=dto.getBtitle() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"> <%=dto.getBcontent().replace("\r\n", "<br>") %></td>
				</tr>
				<tr>
					<td colspan="4" align="center"> 
						<button type="button" onclick="location.href='FreeBoardEdit.jsp?bnum=<%=dto.getBnum()%>';">수정 하기</button>
						<button type="button" onclick="deletePost();">삭제 하기</button>
						<button type="button" onclick="location.href='FreeBoardList.jsp';">목록 보기</button>
					</td>
				</tr>
			</table>	
		</form>
	</section>
</body>
</html>
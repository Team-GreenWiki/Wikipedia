<%@page import="java.util.Map"%>
<%@page import="comment.CommentDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	<form action="../CommentProcess.jsp" method="post" >
	<table>
		<tr>
			<td class="comment_Tag"><button onclick="">PURPOSE</button></td>
			<td class="comment_Tag"><button onclick="">USING</button></td>
			<td class="comment_Tag"><button onclick="">MOREINFO</button></td>
			<td class="comment_Tag"><button onclick="">QNA</button></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td><img alt="" src="../img/HatchfullExport-All/comment_emoticon.png"></td>
			<td>user_id</td>
		</tr>
		<tr>
			<td colspan="2"><%-- <%=dto.getContents() %> --%></td>
		</tr>
	</table>
</form>
</body>
</html>
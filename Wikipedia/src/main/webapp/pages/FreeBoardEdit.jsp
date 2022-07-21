<%@page import="utils.JSFunction"%>
<%@page import="FreeBoard.FreeBoardDAO"%>
<%@page import="FreeBoard.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	String bnum = request.getParameter("bnum");			// 일련번호 받기
	FreeBoardDAO dao = new FreeBoardDAO(application); 	// DAO 생성
	FreeBoardDTO dto = dao.selectView(bnum); 			// 게시글 가져오기
	System.out.print(dto.getBtitle());	
	String sessionId = session.getAttribute("userId").toString();
	
	/* if(!sessionId.equals(dto.getId())){
		JSFunction.alertBack("작성자만 수정할 수 있습니다.", out);
		return;
	} */
	
	dao.close();
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/FreeBoardEdit.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script>
		function validateForm(form){
			if(form.title.value == ""){
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}
			if(form.content.value == ""){
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
		}
	</script>
	
	<%@ include file="../include/Header.jsp" %>
	
	<section class="FreeBoardEdit">
	
		<h2>자유게시판</h2>
		
		<form action ="../process/FreeBoardEditProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
			<input type="hidden" name="bnum" value="<%=dto.getBnum() %>">
			
			<table border="1" width="90%">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="btitle" style="width: 90%" value="<%=dto.getBtitle() %>" >
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="bcontent" style="width: 90%; height: 100px;"><%=dto.getBcontent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit"> 작성 완료</button>
						<button type="reset">초기화</button>
						<button type="button" onclick="location.href='List.jsp'">목록 보기</button>
					</td>				
				</tr>
			</table>
		</form>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


	<jsp:include page="./Link.jsp"></jsp:include>
	
	<h2>자유게시판</h2>
	
	<form action ="../process/FreeBoardWriteProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this);">
	
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="btitle" style="width: 90%">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="bcontent" style="width: 90%; height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit"> 작성 완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='FreeBoardList.jsp'">목록 보기</button>
				</td>				
			</tr>
		</table>
	</form>
	
</body>
</html>







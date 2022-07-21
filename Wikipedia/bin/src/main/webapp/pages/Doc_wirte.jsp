<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../process/LoginChecker.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#inputArea{
		display: flex;
		flex-direction: column;
	}
</style>
</head>
<body>
	<%-- <%@ include file="../include/Header.jsp" %> --%>
	
	<form action="../process/Doc_writeProcess.jsp" name="frm" method="post">
		<table border="1">
			<tr>
				<td><h2>새 문서 작성</h2></td>
				<td><button type="button" onclick="addSubtitle();">소제목 추가</button></td>
				<td><button type="button" onclick="addContent();">내용 추가</button></td>
				<td><button type="button" onclick="removeLast();">항목 제거</button></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><input type="text" name="doc_title" id="doc_title" /></td>
			</tr>
			<tr>
				<td colspan="4">
					<div id="inputArea"></div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="button" onclick="return transport();">저장</button>
					<button type="button" onclick="">돌아가기</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="doc_content" id="doc_content" />
	</form>
	
	<script>
		let doc_title = document.getElementById("doc_title");
		let inputArea = document.getElementById("inputArea");
		let doc_content = document.getElementById("doc_content");
		
		// 부제 추가
		function addSubtitle(){
			let newSubtitle = document.createElement("input");
			newSubtitle.setAttribute("type", "text");
			newSubtitle.setAttribute("class", "subtitle");
			
			inputArea.appendChild(newSubtitle);
		}
		
		// 내용 추가
		function addContent(){
			let newContent = document.createElement("textarea");
			newContent.setAttribute("class", "content");
			
			inputArea.appendChild(newContent);
			
			newContent.addEventListener("onKeyDown", resizeContent());
			newContent.addEventListener("onKeyUp", resizeContent());
		}
		
		// 마지막 요소 제거
		function removeLast(){
			if(inputArea.firstElementChild)
			inputArea.removeChild(inputArea.lastChild);
		}
		
		// 입력완료
		function transport(){
			if(doc_title.value == ""){
				alert("문서 제목은 필수입력사항입니다.");
				return false;
			}
			
			let content = "";
			let arr = inputArea.children;
			for(i = 0; i < arr.length; i++){
				if(arr[i].getAttribute("class") == "subtitle"){
					content += "<input type='text' class='subtitle' value='" + arr[i].value + "'>";
				} else if(arr[i].getAttribute("class") == "content"){
					content += "<textarea class='content'>" + arr[i].value + "</textarea>";
				}
			}
			doc_content.value = content;
			
			frm.submit();
		}
		
		function resizeContent(){
			this.height = this.scrollHeight + "px";
		}
		
		// 기본 입력부 추가
		addSubtitle();
		addContent();
	</script>
</body>
</html>
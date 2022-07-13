<%@page import="document.DocumentDTO"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위키 문서 작성 페이지</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	.subtitle_input{
		width:250px;
		height:35px;
	}
	.content_area{
		width:750px;
		height:300px;
	}
	td{
		display:block;
	}
</style>
</head>
<body>
	
	
	
	<form action="DocumentProcess.jsp" method="post" name="WriteFrm">
	<b>새로운 위키 문서 작성</b> - <input type="text" placeholder="제목을 입력하세요" name="title">
	<button type="button" onclick="addBox();" name="textBtn">내용 추가</button>
	<button type="button" onclick="removeBox();" name="removeBtn">내용 삭제</button>
		<table name="align_table" border='1' width="1080px">
			<tr>
				<td>
					<input type="text" name="subtitle1" placeholder="subtitle1" class="subtitle_input"/>
					<textarea name='content1' placeholder="content1" class="content_area"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">내용 저장</button>
	</form>
	
	<script>
	var count = 2;
	let align_table = document.getElementsByName("align_table");
	var btn = document.getElementsByName("textBtn");
	var removebtn = document.getElementsByName("removeBtn");
	let tbody = document.querySelector("tbody");
	
	function addBox () {
		if(count>5){
			alert("내용은 5개까지만 추가할 수 있습니다.");
			btn.disabled = "true";
			return;
			count =5;
		}
		let newTd = document.createElement("td");
		let newTr = document.createElement("tr");
		
		// subtitle 추가
		let newSubtitle = document.createElement("input");
		newSubtitle.name = "subtitle" + count;
		newSubtitle.setAttribute("placeholder", "subtitle" + count);
		newSubtitle.setAttribute("class", "subtitle_input");
		newTd.appendChild(newSubtitle);
		newTr.appendChild(newTd);
	  	
		// content 추가
	    let newContent = document.createElement('textarea');
	    newContent.name = 'content' + count;
	    newContent.setAttribute("placeholder", "content" + count);
	    newContent.setAttribute("class", "content_area");
	    newTd.appendChild(newContent);
		newTr.appendChild(newTd);
		
		tbody.appendChild(newTr);
	    count++;
	}
	
	//
	function removeBox(){
		if(count<=2){
			alert("내용은 최소 하나이상 존재해야 합니다.");
			removebtn.disabled = "true";
			return false;
		}
		
		let newTd = document.createElement("td");
		let newTr = document.createElement("tr");
		
		if(confirm("정말 삭제 하시겠습니까?\r\n맨 아래의 내용부터 삭제됩니다")){
			tbody.removeChild(tbody.lastChild);
			if(count<=2){
				count=2;
			}else{
				count--;
			}
			
		}else{
			return false;
		}
		
	}
	
	
	</script>
</body>
</html>
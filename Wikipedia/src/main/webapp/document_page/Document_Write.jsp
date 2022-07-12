<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h2>새 위키 문서 작성</h2>
	
	<form action="DocumentProcess.jsp" method="post" name="WriteFrm">
		<table name="align_table" border='1' width="1080px">
			<tr>
				<td>
					<input type="text" name="subtitle1" placeholder="subtitle1" class="subtitle_input"/>
					<textarea name='content1' placeholder="content1" class="content_area"></textarea>
				</td>
			</tr>
		</table>
		<button type="button" onclick="addBox();" name="textBtn">내용 추가</button>
	</form>
	
	<script>
	let count = 2;
	let align_table = document.getElementsByName("align_table");
	var btn = document.getElementsByName("textBtn");
	let tbody = document.querySelector("tbody");
	
	function addBox () {
		if(count>5){
			alert("내용은 5개까지만 추가할 수 있습니다.");
			btn.disabled = "true";
			return;
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
	</script>
</body>
</html>
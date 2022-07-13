<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="docontent.DocontentDTO"%>
<%@page import="docontent.DocontentDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="document.DocumentDTO"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	String docnum = request.getParameter("docnum"); // 일련번호 받기
    	DocumentDAO dao = new DocumentDAO(application); //  DAO생성
    	DocumentDTO dto = dao.selectView(docnum); // 게시글 가져오기 
    	
    	/* String sessionId = session.getAttribute("userId").toString();
    	
    	if(!sessionId.equals(dto.getId())){
    		JSFunction.alertBack( sessionId+"님은 작성자가 아닙니다."+" 글 작성자는 "+dto.getId()+"님 입니다.", out);
    		return;
    	} */
    	dao.close();
  
		//작성되었던 문서의 내용을 가져옴
		DocontentDAO dao2 = new DocontentDAO(application);
		DocontentDTO dto2 = dao2.selectView(docnum);
		String subtitle1 = request.getParameter("subtitle1");
		String subtitle2 = request.getParameter("subtitle2");
		String subtitle3 = request.getParameter("subtitle3");
		String subtitle4 = request.getParameter("subtitle4");
		String subtitle5 = request.getParameter("subtitle5");
		String content1 = request.getParameter("content1");
		String content2 = request.getParameter("content2");
		String content3 = request.getParameter("content3");
		String content4 = request.getParameter("content4");
		String content5 = request.getParameter("content5");
		
		
	%>
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


	
	<form action="Document_Edit_Process.jsp?docnum=<%=docnum%>" method="post" name="WriteFrm" >
	<b>기존의 위키 문서 수정</b> - <input type="text" placeholder="제목을 입력하세요" name="title" value="<%=dto.getTitle()%>">
	<button type="button" onclick="addBox();" name="textBtn">내용 추가</button>
	<button type="button" onclick="removeBox();" name="removeBtn">내용 삭제</button>
		<table name="align_table" border='1' width="1080px">
			<tr>
				<td>
					<input type="text" name="subtitle1" placeholder="subtitle1" class="subtitle_input" value="<%=dto2.getSubtitle1() %>"/>
					<textarea name='content1' placeholder="content1" class="content_area"><%=dto2.getContent1() %></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">내용 저장</button>
	</form>
	
	<script>
	let count = 2;
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
	
	//내용 삭제 메서드
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
	<%
	
	
	
			Map<String,String> content_map = new HashMap<>();
			content_map.put(dto2.getSubtitle2(), dto2.getContent2());
			content_map.put(dto2.getSubtitle3(), dto2.getContent3());
			content_map.put(dto2.getSubtitle4(), dto2.getContent4());
			content_map.put(dto2.getSubtitle5(), dto2.getContent5()); 
			
			System.out.println("get : " + content_map.get("subtitle1"));
			for(int i =2;i<=5;i++){
				String content = content_map.get("subtitle" + i);
				System.out.println("content : " + content);
			if(content_map.get("subtitle"+i)!="null"){%>
				<script>addBox()</script>
			<%	
				}
			}
			
			dao2.close();
			%>
			<script>
			let i = 2;
			var subtitle_box = document.getElementsByName("subtitle2");
			var content_box = document.getElementsByName("content2");
			subtitle_box[0].value = "<%=dto2.getSubtitle2()%>";
			content_box[0].innerText = "<%=dto2.getContent2()%>";
			var subtitle_box = document.getElementsByName("subtitle3");
			var content_box = document.getElementsByName("content3");
			subtitle_box[0].value = "<%=dto2.getSubtitle3()%>";
			content_box[0].innerText = "<%=dto2.getContent3()%>";
			var subtitle_box = document.getElementsByName("subtitle4");
			var content_box = document.getElementsByName("content4");
			subtitle_box[0].value = "<%=dto2.getSubtitle4()%>";
			content_box[0].innerText = "<%=dto2.getContent4()%>";
			var subtitle_box = document.getElementsByName("subtitle5");
			var content_box = document.getElementsByName("content5");
			subtitle_box[0].value = "<%=dto2.getSubtitle5()%>";
			content_box[0].innerText = "<%=dto2.getContent5()%>";
			//1~5 까지의 박스에 각 DocontentDTO의 값 가져오기 
			</script>
</body>
</html>
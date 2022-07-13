<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<link href="../css/FreeBoard.css" rel="stylesheet" type="text/css" />
<body>

	<%-- <jsp:include page="../include/Header.jsp"></jsp:include> --%>

	<div>
		<section id="board">
			<h2>자유게시판</h2>
			<p class="class"></p>
			<h3><img src="../img/HatchfulExport-All/MainLogoMini.png" class="src"></h3>
			<p class="need">당신이 필요한 곳 어디든</p>
			<p class="content">없는 것이 없는, 최상의 자료만 제공해 드리도록 노력하겠습니다.</p>	
		</section>
		
		<!-- 여기 사이에 더미 테이블에 대한 제목, 내용 -->
		
		<div>
			<form name="frm" method="post" action="">
				<section class="dummy">
					<p class="addComment">댓글 쓰기</p>
					<textarea rows="10" cols="100" id="comment" placeholder="로그인 후 입력 가능합니다." onclick="commentForm();"></textarea>
					<p class="write"><input type="text" name="writer" class="writer" placeholder="작성자"></p>
					<p><input type="text" name="pass" class="pass" placeholder="비밀번호"></p>
					
					<p class="bottom">
						<input type="submit" value="저장" name="comm" class="comm" onclick="validateForm(this.frm);">
						<input type="reset" value="취소" class="cancel">
					</p>
				</section>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	
		function commentForm() {
			document.getElementById("comment").addEventListener('click',commentForm);
			alert("로그인 후 이용하세요.");
		}
	
	
		function validateForm(form) {
			if (frm.writer.value == "") {
				alert("작성자를 입력하세요.");
				return false;
			}
			
			if (frm.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				return false;
			}
		}
		
		if (validateFrom == true) {
			alert("저장되었습니다.");
		}
		
		
	</script>
</body>
</html>
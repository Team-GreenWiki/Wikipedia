<%@page import="document.DocumentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="document.DocumentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.comment_Tag{
	background-color: gray;
	}
	textarea {
			width: 70%;
			height: 50px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
			margin-left:20px;
			margin-top : 15px;
		}
	.comment_write_btn{
		width:60px;
		height:50px;
	}
	.comment_input{
		text-align:center;
	}
</style>
</head>
<body>
	
	<!-- 댓글기능 확인을 위한 임시 문서 jsp입니다. -->
	
	<!-- dto 는 문서 정보에 대한 객체
		dto2 는 문서 내용에 대한 객체
	 -->
	
	
	
	<h2>문서 1번 ( 샘플 )</h2>
	<hr>
	<table width="80%" align="center">
		<tr>
			<td><%= dto.title %></td>
		</tr>
		<tr>
			<td><%= dto2.subtitle1 %></td>
		</tr>
		<tr>
			<td><%= dto2.docontent1 %></td>
		</tr>
		<tr>
			<td><%= dto2.subtitle2 %></td>
		</tr>
		<tr>
			<td><%= dto2.docontent2 %></td>
		</tr>
		<tr>
			<td><%= dto2.subtitle3 %></td>
		</tr>
		<tr>
			<td><%= dto2.docontent3 %></td>
		</tr>
		<tr>
			<td><%= dto2.subtitle4 %></td>
		</tr>
		<tr>
			<td><%= dto2.docontent4 %></td>
		</tr>
		<tr>
			<td><%= dto2.subtitle5 %></td>
		</tr>
		<tr>
			<td><%= dto2.docontent5 %></td>
		</tr>
		<br/><br/><br/>
		<hr>
	</table>
	
	<br/><br/>
	<hr>
	<form action="" method="get" name="comment_write_form">
		<table border='1' width="40%" align="center">
			<tr>
				<td class="comment_Tag"><button onclick="">PURPOSE</button></td>
				<td class="comment_Tag"><button onclick="">USING</button></td>
				<td class="comment_Tag"><button onclick="">MOREINFO</button></td>
				<td class="comment_Tag"><button onclick="">QNA</button></td>
				
			</tr>
			<tr>
				<td colspan='4'>
					<div class="comment_input">
						<textarea placeholder="댓글을 입력하세요" name="user_comment_input"></textarea>
						<!-- 플레이스 홀더 안에 선택한 태그 표시 기능을 el등을 이용해서 표시 기능 추가해야함 -->
						<button class="comment_write_btn" type="submit">작성</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	

	
			

	
	
</body>
</html>
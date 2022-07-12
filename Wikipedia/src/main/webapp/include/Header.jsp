<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String fullUri = request.getRequestURI();
	String path = fullUri.substring(fullUri.lastIndexOf('/') + 1);
	boolean result = path.equals("Index.jsp");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./css/Header.css" />
=======
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link href="../css/Header.css" rel="stylesheet" type="text/css" />
  
>>>>>>> branch 'main' of https://github.com/Team-GreenWiki/Wikipedia.git
</head>
<body>
	<header>
		<div class="header1">
			<h1><a href="../pages/Index.jsp"><img src="../img/HatchfulExport-All/MainLogoMini.png"></a></h1>
			<form action="../process/SearchProcess.jsp" method="get">
	           	<input type="text" class="input_search" name="input_search">
	           	<button type="submit" class="searchBtn" /></button>
	       	</form>
			<c:choose>
				<c:when test="${ sessionScope.userId == null }"><p><a href="../pages/Login.jsp">로그인</a></p></c:when>
				<c:when test="${ sessionScope.userId != null }"><p><a href="../pages/My_Info.jsp">내 정보</a></p></c:when>
			</c:choose>
		</div>
		<div class="header2">
			<ul>
				<li><a href="">I'm Feeling Lucky</a></li>
				<li><a href="">자유게시판</a></li>
			</ul>
		</div>
	</header>
</body>
</html>
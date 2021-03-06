<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userId;
	if(session.getAttribute("userId") != null)
		userId = session.getAttribute("userId").toString();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wikipedia 우리 모두의 백과사전</title>
    <link href="../css/Index.css" rel="stylesheet" type="text/css" />
    <link href="../css/Header.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../include/Header.jsp" %>

    <div class="container">
        <section class="main1">
            <h1><a href="Index.jsp" class="mainLogo"><img src="../img/HatchfulExport-All/MainLogoMini.png"></a></h1>
            <form action="../process/SearchProcess.jsp?search_type=doc_title" method="post">
            	<input type="text" class="input_search" name="search_word">
            	<button type="submit" class="searchBtn" /></button>
            </form>
            <ul class="navMenu">
            	<c:choose>
            		<c:when test="${ sessionScope.userId == null }"><li><a href="../pages/Login.jsp">로그인</a></li></c:when>
            		<c:when test="${ sessionScope.userId != null }"><li><a href="../pages/My_info.jsp">내 정보</a></li></c:when>
            	</c:choose>
            	<li><a href="../pages/Doc_view.jsp?doc_num=rnd">I'm Feeling Lucky</a></li>
            </ul>
        </section>

        <section class="main2">
            <div>
                <h2>What is Lorem Ipsum?</h2>
                <h3>Lorem Ipsum</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <div>
                <h2>Where does it come from?</h2>
                <h3>Lorem Ipsum</h3>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            </div>
        </section>
    </div>
</body>
</html>
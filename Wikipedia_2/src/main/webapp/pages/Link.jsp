<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="90%">
	<tr>
		<td align="center">
			<% if (session.getAttribute("userId") == null) { %>
					<!--  로그아웃 상태이면 로그인 링크를 출력-->
					<a href="./Login.jsp">[로그인]</a>
			<%	} else {  %>
					<!-- 로그인 상태면 로그아웃 버튼 출력-->
					<a href="./Logout.jsp">[로그아웃]</a>
			<%	} 	%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="./My_info.jsp">[내정보]</a>
		</td>
	</tr>
</table>
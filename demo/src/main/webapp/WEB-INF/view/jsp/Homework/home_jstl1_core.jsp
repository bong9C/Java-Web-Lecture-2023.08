<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
	<style>td { padding: 3px; }</style>
</head>
<body style="margin: 40px;">
	<div class = "text-center";>
	<h1>JSTL(JSP Standard Tag Library) Core</h1>
	<hr>
	
	<table border="1">
	<table class="table table-bordered mt-2"> <!-- bordered : 선 -->
		<tr><th>Index</th><th>Count</th><th>아이디</th><th>이름</th><th>주소</th></tr>
	<c:forEach var="member" items="${memberList}" varStatus="loop">
		<tr>
			<td>${loop.index}</td>
			<td>	<%-- 홀수면 blue, 짝수면 red, 아래 id 문제의 개선책 --%>
				<span style="color: ${loop.count mod 2 eq 1 ? 'blue' : 'red'};">${loop.count}</span>
			</td>
			<td>	<%-- id가 홀수면 blue, 짝수면 red --%>
			<c:if test="${member.id mod 2 eq 1}">	<%-- ${member.id % 2 == 1} --%>
				<span style="color: blue;">${member.id}</span>
			</c:if>
			<c:if test="${member.id mod 2 eq 0}">
				<span style="color: red;">${member.id}</span>
			</c:if>
			</td>
			<td>	<%-- 첫번째줄 배경색은 yellow, 마지막줄은 cyan --%>
			<c:if test="${loop.first}">
				<span style="background-color: yellow;">${member.name}</span>
			</c:if>
			<c:if test="${loop.last}">
				<span style="background-color: cyan;">${member.name}</span>
			</c:if>
			<c:if test="${not loop.first and not loop.last}">
				${member.name}
			</c:if>
			</td>
			<td>	<%-- 한국이면 배경색을 orange, 미국이면 skyblue --%>
			<c:if test="${member.addr.country eq '한국'}">
				<span style="background-color: orange;">${member.addr}</span>
			</c:if>
			<c:if test="${member.addr.country eq '미국'}">
				<span style="background-color: skyblue;">${member.addr}</span>
			</c:if>
			<c:if test="${member.addr.country ne '한국' and member.addr.country ne '미국'}">
				${member.addr}
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>
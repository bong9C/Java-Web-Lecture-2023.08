<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
	<style>
		td { padding: 3px; text-align: center; }
	</style>
</head>
<body style="margin: 50px">
	<h3>글 쓰기</h3>
	<hr>
	<form action="/demo/write" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td>${board.title}</td>
		</tr>
		<tr>
			<td>번역가능 언어</td>
			<td>${board.languages}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.content}</td>
		</tr>					
	</table>
</body>
</html>
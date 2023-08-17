<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 표현언어</title>
	<style>td { padding: 3px; }</style>
</head>
<body style="margin: 40px:">
	<h1>Collections</h1>
	<hr>
	<table border="1">
	 	<tr><th>산술표현식</th><th>결과</th></tr>
	 	<tr><th>\${fruitArray[0]}</th><th>${fruitArray[0]}</th></tr>
	 	<tr><th>\${fruitArray[3]}</th><th>${fruitArray[3]}</th></tr>
	 	<tr><th>\${sportsList[0]}</th><th>${sportsList[0]}</th></tr>
	 	<tr><th>\${sportsList[2]}</th><th>${sportsList[2]}</th></tr>
	 	<tr><th>\${map.key}</th><th>${map.key}</th></tr>
	 	<tr><th>\${map.value}</th><th>${map.value}</th></tr>
	</table>
</body>
</html>
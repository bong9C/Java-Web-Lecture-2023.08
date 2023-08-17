<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 표현언어</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px:">
	<h1>POJO(plain Old Java object)</h1>
	<hr>
	<table border="1">
	 	<tr><th>표현식</th><th>결과</th></tr>
	 	<tr><th>\${m1.id}</th><th>${m1.id}</th></tr>
	 	<tr><th>\${m1.name}</th><th>${m1.name}</th></tr>
	 	<tr><th>\${m1.addr}</th><th>${m1.addr}</th></tr>
	 	<tr><th>\${m2.id}</th><th>${m2.id}</th></tr>
	 	<tr><th>\${m2.name}</th><th>${m2.name}</th></tr>
	 	<tr><th>\${m2.addr}</th><th>${m2.addr}</th></tr>
	 	<tr><th></th><th></th></tr>
	 	<tr><th>\${memberlist[1].id}</th><th>${memberlist[1].id}</th></tr>
	 	<tr><th>\${memberlist[1].name}</th><th>${memberlist[1].name}</th></tr>
	 	<tr><th>\${memberlist[1].addr}</th><th>${memberlist[1].addr}</th></tr>

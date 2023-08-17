<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 표현언어</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px:">
	<h1>EL Operator(표현언어 연산자)</h1>
	<hr>
	<table border="1">
	 	<tr><th>산술표현식</th><th>결과</th></tr>
	 	<tr><td>\${100}</td><td>${100}</td></tr>
	 	<tr><td>\${10 + 1}</td><td>${10 + 1}</td></tr> <!-- 화면에 보여지게 하고 싶으면 \ 앞에 역슬래시 -->
	 	<tr><td>\${"10" + 1}</td><td>${"10" + 1}</td></tr> <!-- 왼쪽은 작성, 오른쪽은 결과값 -->
	 	<tr><td>\${null + 1}</td><td>${null + 1}</td></tr> <!-- + 는 오로지 숫자에서만 사용 -->
	 	<tr><td>\${"hello"}</td><td>${"hello"}</td></tr>
	 	<tr><td>\${"hello"}${"안녕"}</td><td>${"hello"}${"안녕"}</td></tr>
	 	<%-- <tr><td>\${"hello" + "안녕"}</td><td>${"hello" + "안녕" }</td></tr> 에러 --%>
	 	<tr><th>산술표현식</th><th>결과</th></tr>
	 	<tr><td>\${20 - 10}</td><td>${20 - 10}</td></tr>
	 	<tr><td>\${20 * 10}</td><td>${20 * 10}</td></tr>
	 	<tr><td>\${20 / 10}</td><td>${20 / 8}</td></tr>
	 	<tr><td>\${20 div 10}</td><td>${20 div 8}</td></tr>
	 	<tr><td>\${20 % 10}</td><td>${20 % 8}</td></tr>
	 	<tr><td>\${20 mod 10}</td><td>${20 mod 8}</td></tr>
	 	<tr><th>비교연산표현식</th><th>결과</th></tr>
	 	<tr><td>\${20 == 10}</td><td>${20 == 10}</td></tr>
	 	<tr><td>\${20 eq 10}</td><td>${20 eq 10}</td></tr>  <!-- eq 같다 -->
	 	<tr><td>\${20 ne 10}</td><td>${20 ne 10}</td></tr>	<!-- ne 같지 않다 -->
	 	<tr><td>\${"안녕" == "hello"}</td><td>${"안녕" == "hello"}</td></tr>
	 	<tr><td>\${"안녕" eq "hello"}</td><td>${"안녕" eq "hello"}</td></tr>
	 	<tr><td>\${20 > 10}</td><td>${20 > 10}</td></tr>
	 	<tr><td>\${20 gt 10}</td><td>${20 gt 10}</td></tr>	<!-- gt > -->
	 	<tr><td>\${20 ge 10}</td><td>${20 ge 10}</td></tr>	<!-- ge >= -->
	 	<tr><th>논리연산표현식</th><th>결과</th></tr>
	 	<tr><td>\${20 > 10 && "안녕" == "hello"}</td><td>${20 > 10 && "안녕" == "hello"}</td></tr>
	 	<tr><td>\${20 gt 10 and "안녕" eq 'hello'}</td><td>${20 gt 10 and "안녕" eq 'hello'}</td></tr>
	 	<tr><td>\${20 gt 10 or "안녕" eq "hello"}</td><td>${20 gt 10 and "안녕" eq "hello"}</td></tr>
	 	<tr><td>\${not("안녕" eq "hello")}</td><td>${not( "안녕" eq "hello")}</td></tr>
	 	<tr><th>빈 문자열 확인</th><th>결과</th></tr>
	 	<tr><th>\${empty"hello" }</th><th>${empty"hello" }</th></tr>
	 	<tr><th>\${empty"" }</th><th>${empty"" }</th></tr>
	 	<tr><th>\${empty null }</th><th>${empty null }</th></tr>
	</table>
	<h3>사례</h3>
	<ul>
		<li>파라메타 값은 ${empty param.num ? '입력하지 않았음' : param.num}입니다.</li>	<!-- 삼항연산자 -->
		<li><a class="nav-link ${menu eq 'board' ? 'active' : ''} " href="#" >게시판</a></li>
	</ul>
</body>
</html>
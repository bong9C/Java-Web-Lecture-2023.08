<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert Message</title>
</head>
<body>
	<script>
		let msg = '${msg}'; // 메세지를 넘겨주면 메세지를 넘겨 받을 수 있는 코드 
		let url = '${url}';
		alert(msg);
		location.href = url;
	</script>
</body>
</html>
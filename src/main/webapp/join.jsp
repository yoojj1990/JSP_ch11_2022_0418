<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원 가입 양식</h2>
	<hr>
	<form action="joinOk.jsp" method="post">
		아이디 : <input type="text" name="id" ><br><br>
		비밀번호 : <input type="password" name="pw" ><br><br>
		이름 : <input type="text" name="name" ><br><br>
		이메일 : <input type="text" name="email" ><br><br>
		<input type="submit" value="회원가입"><br><br>
	</form>
</body>
</html>
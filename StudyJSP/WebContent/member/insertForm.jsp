<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/insertForm.jsp</h1>
<form action = "insertPro.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="text" name="pass"><br>
이름 : <input type="text" name="name"><br>
<input type="submit" value="회원가입">
</form>
<form action ="info.jsp" method="post">
정보확인 : <input type="text" name="info">
<input type= "submit" value="정보확인">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1{text-align: center}
table{width: 450px; marcin :auto;}
td{border :1px dotted gray;}
</style>
</head>
<body>
<form action="mailSend.jsp" method="post">
<h1>메일전송</h1>
<table>
<tr><td>보내는 사람 : </td><td><input type="text" name="sender" value = "m.dorihosi@gmail.com"></td></tr>
<tr><td>받는 사람 : </td><td><input type="text" name="receiver"></td></tr>
<tr><td>제목 : </td><td><input type="text" name="subjerct"></td></tr>
<tr>
	<td>내용 : </td>
	<td><textarea name="content" cols= 40 rows= 20></textarea></td></tr>
	<tr><td align=center colspan=2><input type="submit" value="보내기"></td></tr>
</table>
</form>
</body>
</html>
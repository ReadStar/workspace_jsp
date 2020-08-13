<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/testForm3.jsp</h1>
<form action="testPro3.jsp" method="post">
이름 : <input type="text" name ="name" ><br>
성별 : <input type="radio" name ="gender" value="남">남
     <input type="radio" name ="gender" value="여">여<br>
취미 : <input type="checkbox" name = "hobby" value="여행">여행
	 <input type="checkbox" name = "hobby" value="독서">독서
	 <input type="checkbox" name = "hobby" value="게임">게임
	 <input type="checkbox" name = "hobby" value="축구">축구<br>
<input type="submit" value="전송">
</form>

</body>
</html>
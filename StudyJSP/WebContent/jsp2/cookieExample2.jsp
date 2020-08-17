<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieExample2.jsp</h1>
<%
//서버 request 저장된 "lang"파라미터 가져와서 변수에 저장
//쿠키값 생성 쿠키이름 "clang" 쿠키값 파라미터에서 가져온 값
//시간설정, 클라이언트에 저장
//"언어쿠키값설정" coom,ieExample1.jsp 이동
String lang = request.getParameter("lang");
out.println(lang);
Cookie cookie=new Cookie("clang", lang);
cookie.setMaxAge(1800);
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("언어 쿠키 설정");
	location.href="cookieExample1.jsp";
</script>
</body>
</html>
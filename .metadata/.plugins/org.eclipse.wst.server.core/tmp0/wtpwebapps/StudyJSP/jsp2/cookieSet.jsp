<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieSet.jsp</h1>
<%
// session.setAttribute("이름", 모든형적용 값);
// 쿠키값 생성 
// 쿠키를 사용하기 위해서 객체생성(기억장소 할당)
// Cookie cookie=new Cookie("이름","문자열값");
Cookie cookie=new Cookie("cook","CookieValue");
// 쿠키값 유지 시간 설정  1800초  30분
cookie.setMaxAge(30*60);
// 서버에서 만든 쿠키값을 클라이언트에 저장
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("쿠키값 생성");
	location.href="cookieForm.jsp";
</script>
</body>
</html>
 
 
 
 
 
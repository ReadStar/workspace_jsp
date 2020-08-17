<%@ page language="java" contentType="text/html; charset=UTF-8"	
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/ookieExample1.jsp</h1>
<%
//쿠키값 가져오기
Cookie cookies[] = request.getCookies();
//if 쿠키값이 있으면 for if 쿠키이름"clang" 찾기 쿠키값 출력
String clang = "korea";
if(cookies !=null){
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("clang")){
		out.print("쿠키값 : "+ cookies[i].getValue()+"<br>");
			clang=cookies[i].getValue();
		}
	}
}
//clang변수에 저장된 값 쿠키값 "korea"와 같으면 "안녕하세요"
//															 와 같지않으면 "Hello"
if(clang.equals("korea")){
	%><h1>안녕하세요</h1><%
	}else{
		%><h1>Hello</h1><%
	}
%>
<form action="cookieExample2.jsp" method="post">
<input type="radio" name="lang" value="korea" <%if(clang.equals("korea")){%>checked<%} %>>한국어페이지
<input type="radio" name="lang" value="english" <%if(clang.equals("english")){%>checked<%} %>>영어페이지
<input type="submit" value="언어설정">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieForm.jsp</h1>
<%
// 세션 : 연결정보저장(연결유지정보저장)
// 		   : 페이지 상관없이 값을 유지, 서버에 저장, 로그인정보유지(로그인인증), 보안상 중요한 데이터를 페이지 상관없이 값 유지
// 쿠키 :  페이지 상관없이 값을 유지, 사용자(클라이언트, 유저)에 저장, 보안상 상관없는 값유지, 서버에 부담을 줄이고자 할때
//쿠키값 가져오기
Cookie cookies[] = request.getCookies();
if(cookies !=null){
	for(int i=0; i<cookies.length; i++){
// 		if(쿠키이름이"cook"비교해서 찾기){	
		if(cookies[i].getName().equals("cook")){
		out.print("쿠키이름 : "+cookies[i].getName());
		out.print("쿠키값 : "+ cookies[i].getValue()+"<br>");
		}
	}
}
%>
<input type="button" value="쿠키값하나설정" onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값하나삭제" onclick="location.href='cookieDel.jsp'">
</body>
</html>
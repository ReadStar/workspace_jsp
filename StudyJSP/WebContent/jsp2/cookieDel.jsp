<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/cookieDel.jsp</h1>
<%
//클라이언트 http정보 가져와서 서버 request내장객체 저장
//쿠키값 request에서 가져오기
//쿠키값이 있으면
//for if문 쿠키값 찾기 "cook"
//찾은 쿠기 시간 0설정
//0으로 설정한 쿠키값을 클라이언트에 저장
// "쿠키값 삭제" cookieForm.jsp으로이동
Cookie cookies[ ] = request.getCookies();
		if(cookies != null){
			for(int i = 0; i<cookies.length;i++){
			if(cookies[i].getName().equals("cook")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				}
			}
		}		
		
%>
<script type="text/javascript">
	alert("쿠기값 제거");
	location.href="cookieForm.jsp";
	</script>
</body>
</html>
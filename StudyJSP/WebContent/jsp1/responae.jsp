<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/response.jsp</h1>
<%
// response 내장객체: WAS에서 처리를 하기 위해서 request, response기억장소 생성 처리 담당자 서블릿
//									request정보를 가지고 처리함
//									처리결과를 response기억장소에서 저장-> 웹서버 -> http -> 사용자 
//									서버 처리결과를 저장, 서버에서 사용자의 설정값을 변경
//response.setHeader("헤더이름", "변경값")	헤더값 변경
//서버 -> 클라이언트 설정 바꿈 => 파일첨부 다운로드
//response.setHeader("Content-Disposition", "attachment; filename="+sEncoding);

//response.setContentType("변경할 타입");
// 서버에서 클라이언트로 데이터를 보낼때 text/html형을 바꾸어서 보냄
//response.setContentType("text/html; charset=UTF-8");

//서버에서 쿠키값 만들어서 클라이언트에 보냄
// response.addCookie(쿠키값)

//response.sendRedirect(주소)
//서버에서 클라이언트 응답할때  주소 이동명령 : jsp하이퍼링크
response.sendRedirect("request.jsp");
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/js3/a.jsp</h1>
<%
//자바명령, jsp명령
//폼화면에서 입력한 내용을 http가 들고 서버로 가며
//서버에 받아서 request내장객체(기억장소)에 저장
//request내장객체 : http가 들고간 요청정보를 저장
// request.변수
// request.함수() request.getParameter("파라미터(태그)이름")
//				 request 저장된 내용을 가져와서 => 출력, 데이터베이스 저장 작업
%>
아이디 : <%=request.getParameter("id") %><Br>
비밀번호 : <%=request.getParameter("pass") %><br>
자기소개 : <%=request.getParameter("intro") %><br>
성별 : <%=request.getParameter("gender") %><br>
취미 : <%=request.getParameter("hobby") %><br>
학년 : <%=request.getParameter("grade") %><br>
</body>
</html>
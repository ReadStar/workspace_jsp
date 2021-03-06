<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/session.jsp</h1>
<%
//session내장객체 : 서버와 클라이언트 연결정보를 서버 저장 내장객체
//								서버와 연결 동시에 세션ID부여됨. 
//세션삭제 : 1. 브라우저 창 모두 닫으면 세선삭제
//				   2. 세션유지시간 30분 설정, 30분이상 작업을 하지 않으면 세션 삭제
//				   3. 로그아웃(세션기억장소삭제 명령) 하면 세션삭제
%>
세션ID : <%=session.getId() %><br>
세션생성시간 : <%=session.getCreationTime() %><br>
세션마지막접근시간 : <%=session.getLastAccessedTime()  %><br>
세션유지시간 : <%=session.getMaxInactiveInterval() %><br>
세션유지시간 변경<%//세션유지시간 1시간 변경 %>
<%=session.setMaxInactiveInterval(3600) %> 초<br>
세션값 전체삭제(세션저네기억장소삭제)%
<%session.invalidate();%><br>
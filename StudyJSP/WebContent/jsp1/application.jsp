<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Webcontent/jsp1/application.jsp</h1>
<%
//application 내장객체 : 
//										웹 애플리케이션(웹서버에서 동작하는 프로젝트 ) 정보 저장 내장객체 
//									:	서버가 start되면 application기억장소 하나만 만들어짐
//									:	서버가stop되면 application기억장소 사라짐
%>
서버정보 : <%=application.getServerInfo() %><br>
서버 물리적인 경로 : 	<%=application.getRealPath("/") %><br>
<%
//pageContext 내장객체 : 현 페이지 정보를 저장하는 내장객체
//										: 페이지가 바뀌면 사라지고 바뀐 페이지 정보를 새로이 저장

//out 내장객체 : 출력정보를 저장하는 내장객체 
out.println("출력정보를 저장하는 내장객체");
%>
출력버퍼(기억장소) 전체크기 : <%=out.getBufferSize() %>바이트<br>
출력버퍼 남아있는 크기 : <%=out.getRemaining() %> 바이트<br>
<%
//출력 종료 명령
out.close();
%>
종료하고 출
</body>
</html>
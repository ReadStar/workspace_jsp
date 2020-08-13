<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp/request.jsp</h1>
URL정보 : <%=request.getRequestURL() %> <br>
URI정보 : <%=request.getRequestURI() %> <br>
서버정보 : <%=request.getServerName() %> <br>
서버포트정보 : <%=request.getServerPort() %> <br>
프로토콜 정보 : <%=request.getProtocol()  %> <br>
전송방식 : <%=request.getMethod() %> <br>
프로젝트(컨텍스트) 경로 : <%=request.getContextPath() %> <br>
사용자 IP 정보 : <%=request.getRemoteAddr() %> <br>
<%-- 서버의 물리적인 경로 : <%=request.getRealPath("/") %> <br> --%>
HTTP 헤더정보(타입) : <%=request.getHeader("accept") %><br>
HTTP 헤더 정보(언어)	: <%=request.getHeader("accept-language") %><br>
HTTP 헤더정보(브라우저 종류) : <%=request.getHeader("user-agent") %><br>
HTTP 헤더정보(연결) : <%=request.getHeader("connection") %><br>

</body>
</html>
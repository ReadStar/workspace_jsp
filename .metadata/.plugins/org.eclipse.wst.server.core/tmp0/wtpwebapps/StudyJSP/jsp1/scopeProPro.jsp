<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/scopeProPro.jsp</h1>
<% //request저장된 id파라미터 가져오기 변수 id저장
String id=request.getParameter("id"); 
String pass=request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
</body>
</html>
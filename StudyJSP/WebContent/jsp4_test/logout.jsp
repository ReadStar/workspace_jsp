<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4_test/logout.jsp</h1>
<%
//세션값 전체 삭제
session.invalidate();
//로그아웃
//메인.jsp이동
%>
<script type="text/javascript">
alert("로그아웃");
location.href="loginForm.jsp";
</script>
</body>
</html>
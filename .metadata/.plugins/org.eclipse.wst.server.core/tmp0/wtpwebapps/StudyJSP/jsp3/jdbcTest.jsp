    <%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title h
ere</title>
</head>
<body>
<h1>jdbcTest</h1>
<%
//JDB안에 Driver프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//DriferManager 자바 프로그램이 Drvier 프로그래을 가지고 디비서버 접속 => 접속정보 저장
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="root";
String dbPass="63520321";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
%>
연결성공
</body>
</html>